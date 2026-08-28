# SES機能 リリース前チェックリスト（2026-08-27作成）

対象: thyme/lemongrass jar・sesスキーマDDL・外出しyml・スキルマスタ系データ移植。
本番にsesスキーマは未構築（2026-08-25人間確認。baseline宣言からの初構築）。

## 0. 事前に確定させること（人間判断）

- [x] **リリース対象ブランチ**: feature/license-admin（同時リリース確定 2026-08-27 人間判断。
      本番のses DBユーザー・trackerトークンは後日払い出し）
- [ ] 本番DBの接続情報（ホスト・管理者権限の有無）と接続経路（IPホワイトリスト）
- [ ] メール取込スケジューラを本番で有効にするか・対象アカウント（eigyo@のIMAP認証情報）
- [ ] 本番sesユーザーのパスワード決定（devと別の値にする）

## 1. DDL（sesスキーマ初構築）

- [ ] スキーマ+ユーザー作成: `docs/ddl/setup-ses.sql`（gitignore対象・ローカル保持。
      2026-08-27にgit履歴d0912b2^から復元済み。パスワードCHANGE_MEを本番用に置換して実行）
- [ ] `docs/ddl/schema-ses.sql`（スナップショット版・21テーブル）を ses ユーザーで実行。
      **alter-*.sql の個別適用は不要**（スナップショットに畳み込み済み。skills.description E6・
      skill_relations Y1a・llm-metrics・staff-candidates-region を含むことは確認済み 2026-08-27）
- [ ] 実行後の検証: テーブル数21・`SHOW CREATE TABLE skills`（description列）・
      `skill_relations`（UNIQUE (skill_id, related_skill_id)）
- [ ] スナップショットDDL運用の baseline をこの時点のコミットで宣言（以後の変更はALTER管理へ移行）

## 2. jar（thyme + lemongrass）

- [ ] ビルド元コミットを対象ブランチの最新push済みに固定し、**コミットIDを記録してから**ビルド
- [ ] JDK11（Adoptium）でビルド。lemongrass `clean install` → thyme `clean package` の順
      （lemongrassを先にinstallし直さないと.m2が古く偽コンパイルエラー/旧コード混入）
- [ ] **jar内yml検証（必須）**: `BOOT-INF/classes/application.yml` を展開し
      `git show HEAD:thyme/src/main/resources/application.yml` とdiff一致を確認。
      ローカルymlは**skip-worktree運用で実クレデンシャルを保持しており`git status`では検出できない**。
      コミット版に一時差し替えてビルド→復元の手順を踏む（2026-08-27に焼き込み未遂の実害あり）
- [ ] **thymeとlemongrassは必ずセットで差し替える**（片方だけ更新は不整合）
- [ ] デプロイ順: **停止→差し替え→起動** 厳守（稼働中jarの直接上書きはNoClassDefFoundError実害あり）

## 3. 外出しyml（本番プロファイル）

コミット版ymlはプレースホルダのため、本番側の外出しymlで以下を全て上書き・注入する:

- [ ] ses datasource: url（本番DBホスト/ses）・username・password（コミット版はCHANGE_ME）
- [ ] `SES_MAIL_PASSWORD`（IMAP。メール取込を有効にする場合）
- [ ] `SES_OPENAI_API_KEY`（取込LLM抽出・概要生成・年数バックフィルに必須。
      未設定だと取込は実行時に中断、バックフィルは全件failed空振り）
- [ ] license-adminを出す場合: `tracker.admin.url`（本番tracker向き）+ `TRACKER_ADMIN_TOKEN`。
      trackerブロックはコミット済み（9652781・2026-08-27。url既定localhost:8092、トークンはenv注入）
- [ ] fukuro/pdm datasourceの本番値（既存thyme本番運用の値を踏襲）
- [ ] 編集時タブ厳禁（ymlはスペースのみ。thyme-it実害あり）

## 4. フロント（Lavender）

- [ ] 本番ビルドは `npm run build-prod`（.env.production）。**ステージング用 `npm run build`
      （PUBLIC_URL=/it）を流用しない**。本番のPUBLIC_URL/配置パスを事前確認
- [ ] Node 16系でビルド（Node 22の場合は NODE_OPTIONS=--openssl-legacy-provider が必要）
- [ ] zipはルート直下構造（build/プレフィックス無し）
- [ ] index.html内のstaticパスがPUBLIC_URLと一致することを目視

## 5. スキルマスタ系データ移植（devDB → 本番）

移植対象（トリアージ済み資産。トランザクションデータは移植しない）:

- [ ] `skills` 463語（category・**description=LLM生成概要100%** 込み。skill_idを保持したまま移植）
- [ ] `skill_aliases`（別名。skill_id FK整合のためskillsと同時に）
- [ ] `skill_relations` 780行（承認758/却下22。**却下行も移植する**=再生成バッチの再提案防止の記憶）
- [ ] `unknown_terms` の却下済み行（status=2。同じく再提案防止の記憶。pending行は移植しない）
- [ ] 方式: devDBからSELECTでdump→本番へid保持のままINSERT（本番は空前提なのでAUTO_INCREMENT衝突なし）。
      投入スクリプトは件数ガード+ROLLBACKドライラン付きで作成し、人間`!`実行
- [ ] 検証: 件数一致（skills=463 / relations status別 758+22）・FK孤児ゼロ
- [ ] 移植後: 本番でメール取込を回した後に relink（案件再照合）が必要になったら管理者APIで実行

## 6. リリース後スモーク

- [x] ログイン→スキルマスタ画面（463語・概要表示・関連スキル承認セクション空） — **完了（2026-08-28 ステージング目視OK: 463件・概要ツールチップ表示・承認待ち0件）**
- [x] スキルシート編集: マスタ候補選択でChipサジェスト表示（例: ChatGPT→生成AI） — **完了（2026-08-28 目視OK: ChatGPT選択で関連 OpenAI/生成AI/LLM/AIエージェント/RAG 表示・チップクリックで行追加・自由入力語にはChipなし）**
- [ ] シート保存（その他分類含む）・印刷プレビュー・PDF — **保存はOK（2026-08-28: その他分類含む3件保存成功・400なし）。印刷プレビュー・PDFはブラウザ印刷ダイアログが自動化不可のため人間目視が必要**
- [ ] メール取込を有効にした場合: 手動実行1回→実行履歴で成功・LLMメトリクス記録を確認（課金のため人間承認時のみ・未実施）
- [x] 一般ロールでの表示（本人マッチングビュー・メニュー文言） — **完了（2026-08-28 実機目視OK: メニューは「案件メール一覧・スキルシート」のみ（管理系・提案状況タブ非表示）。「スキルシート」で本人（member/14）へ直行。マッチングタブは不足スキル分析+スコア順一覧が状態フィルタなしで全件表示・閲覧のみで提案/見送りボタンなし）**
- 補足（2026-08-28）: 管理者にライセンス管理メニュー「テナント一覧」表示OK。開くとトークン未設定による安全側エラー（システムエラーバナー+空表示・クラッシュなし）。ボタン見た目統一の退行なし（条件クリア=赤系outlined・編集=contained primary）

## 既知の注意（リリース判断に影響しうる）

- G1バグ: **修正済み**（thyme 69d807d・2026-08-27。起動時に宙吊りrunを自動失敗クローズ）
- G2: lemongrassの既存テスト失敗2件（MatchingServiceTest/TrackerAdminClientTest。G1と無関係・
  他メンバー実装領域）。**リリース前に要解消**（タスクリストG2参照）
- 提案管理一覧mockの「読み込み中...」バグ（起票済み・未着手）
