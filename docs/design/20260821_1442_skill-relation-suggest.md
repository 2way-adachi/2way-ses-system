# 関連スキルのサジェスト設計（タスクY）

作成: 2026-08-21 / 状態: 実装着手（2026-08-21「XYで進めて」指示） / 起点: [タスクY1](../development/20260818_1758_fix-tasks.md)
前提: [スキル入力一本化設計](20260821_1411_skill-input-unification.md)（X。入力箇所はスキルシート側に一本化）

## 1. 目的と方針（人間合意済み）

スキル入力時の登録漏れ対策（例: ChatGPT登録者に生成AIを提示）。**上位概念の自動追加はしない**。
追加という能動アクションの直後にだけChipで控えめに提示し、クリックで追加できるようにする。
関連リンクは**LLMバッチ生成＋人間承認**でマスタに持つ。マッチングでの関連展開（Y3）は保留だが、
データが共通基盤になるよう関係の向きは持っておく。

**制約（設計判断）**: サジェストが出せるのは**マスタに対応付いたスキルを追加したときだけ**
（自由入力語には関連データが無い。方針B=自由入力尊重の帰結として許容。
W1のサジェスト選択で入力するほどチップも出る、という自然なインセンティブになる）。

## 2. データモデル

```sql
skill_relations
  skill_relation_id  int PK AUTO_INCREMENT
  skill_id           int NOT NULL          -- 起点スキル（これを登録した人に提示する）
  related_skill_id   int NOT NULL          -- 提示するスキル
  relation_type      int NOT NULL          -- 0:関連 / 1:上位概念（related_skill_id が skill_id の上位。例 skill=ChatGPT, related=生成AI, type=1）
  status             int NOT NULL DEFAULT 0 -- 0:承認待ち / 1:承認 / 2:却下
  origin             int NOT NULL DEFAULT 0 -- 0:LLM生成 / 1:手動
  llm_model          varchar(64)           -- 生成時のモデル（origin=0のみ）
  create_datetime / update_datetime
  UNIQUE (skill_id, related_skill_id)
```

- 向きは1方向で持つ（ChatGPT→生成AI）。**サジェスト時は両方向を引く**（生成AI登録者にChatGPTも出す。
  逆向き行の重複生成はUNIQUEとバッチ側の重複チェックで防ぐ）
- 却下（status=2）は行を残す（再生成バッチが同じ候補を再提案しないための記憶）
- マスタ外の語への関連は持たない（related_skill_id は必ず skills 参照）

## 3. API契約（今回追加分）

```
GET  /ses/skills/{id}/related                     承認済み関連スキル（両方向・重複除去）
     → { "items": [ { "skillId": 5, "skillName": "生成AI", "relationType": 1 } ] }
     ※ relationType は起点から見た向きに正規化（1=上位概念, 0=関連, 2=下位概念（逆向き行のtype=1））

GET  /ses/skill-master/relations?status=pending   承認待ち一覧（管理者のみ。スキル名解決済みで返す）
     → { "items": [ { "skillRelationId": 1, "skillId": 3, "skillName": "ChatGPT",
                       "relatedSkillId": 5, "relatedSkillName": "生成AI", "relationType": 1 } ] }
POST /ses/skill-master/relations/decision         { "skillRelationId": 1, "approve": true|false }
POST /ses/skill-master/relations/generate         { "all": true } 全スキル / 省略時は関連行が1件も無いスキルのみ
     管理者のみ・同期実行（skill-years-backfill と同じ作法）
     → { "generated": n, "skipped": n }（生成＝承認待ち行の追加数）
```

## 4. LLMバッチ生成

- 実装はメール取込パイプラインの作法を流用（`OpenAiMailExtractor` のHTTP・リトライ・**共有レートゲート
  （OpenAiRateGate・タスクM1/M2）をそのまま通す**）
- 1リクエスト=起点スキル1件。入力: 起点スキル名＋マスタ全語彙（正規名リスト・271語規模）。
  出力スキーマ: `{ "relations": [ { "name": "<マスタ正規名のみ>", "type": "broader" | "related" } ] }`
  上限5件・無ければ空配列を明示
- **マスタに無い名前を返したら破棄**（名前→skill_id解決できた行のみ保存。新語の発明はさせない）
- 既存行（承認済み・却下含む）と重複する候補・逆向き重複はスキップ
- 生成結果は全件 status=承認待ち。**サジェストに使うのは承認済みのみ**
- 実行はステージングで人間がAPIを叩く（ローカルはAPIキー無し）。初回は生成後に承認UIで全件目視（Y4）

## 5. 画面

- **承認UI**: スキルマスタ画面（skillMaster）に「関連スキル承認」セクションを追加。
  承認待ちを「ChatGPT → 生成AI（上位概念）」形式で一覧し、行ごとに承認/却下ボタン
  （unknownTermTriage の作法をパターン元に。一括承認は付けない=初回全件目視の方針）
- **Y2 Chipサジェスト**（skillSheetEdit・W1のAutocompleteと共存）:
  - トリガー: スキル名の**候補選択時（onChange）**。選択した候補の skillId で `GET /ses/skills/{id}/related` を引く
  - 表示: その行の下に1行、最大5件のChip（「関連: [生成AI] [Copilot] …」）。
    シートに既に同名（正規名一致）がある候補は出さない。無視すればそのまま・行のフォーカスが外れたら消える
  - クリック: シートに新規スキル行を追加（name=正規名・他フィールド空）し、そのChipを消す
  - 自由入力（候補選択なし）ではチップを出さない（上記制約）

## 6. 実装タスク分解

1. Y1a(backend): skill_relations DDL（ファイル引き渡し・dev適用は別途）＋Mapper＋
   related/pending/decision/generate の4API＋LLM生成サービス＋テスト
2. Y1b(front): スキルマスタ画面の承認セクション
3. Y2(front): skillSheetEdit のChipサジェスト
4. Y4: 検証（tsc・表示目視・ステージングで初回生成→全件目視承認）

## 7. 非対象

- Y3（マッチングのスキル軸での関連展開）: 保留。relation_type を持つのはこのため
- 上位概念の自動追加・モーダル・常設リコメンド欄: 作らない（人間判断）
