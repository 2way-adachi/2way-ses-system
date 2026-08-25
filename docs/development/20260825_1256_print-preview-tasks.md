# 修正タスクリスト: スキルシート印刷プレビュー（2026-08-25作成・修正用セッション向け）

対象: Lavender `lavender/src/views/skillSheet/skillSheetPrint.tsx` / `skillSheetPrint.scss`
出典: 2026-08-25 人間の実機確認（印刷プレビューの見づらさ指摘）。見やすさ重視の方針

## A. バグ（優先）

- [x] **A1. 自己PRの改ページ制御**（2026-08-25 実装完了。`.ssp-self-pr-block`に`page-break-inside: avoid`+見出しの泣き別れ防止。E2E DOM検証PASS・**人間の実機目視のみ残**）
  - 箇所: `skillSheetPrint.tsx:465-466` — 自己PR（見出し+本文）は経歴表直後に置かれるだけで、
    改ページ制御が一切ない。`.ssp-self-pr` にも break 指定なし（`skillSheetPrint.scss`）
  - 方針: 自己PRセクションをラッパーで括り `page-break-inside: avoid` を付与
    （パターン元: `.ssp-career-row` の `skillSheetPrint.scss:178`）。ページ内に収まらない場合は
    セクションごと次ページ送りになる。1ページを超える長文は avoid が効かずブラウザが途中で
    割るため、見出しと本文先頭の泣き別れ防止に `.ssp-section-title` へ `page-break-after: avoid` を併用
  - 確認: 経歴5件+自己PR長文のシートで印刷プレビューを実機目視（自己PRがページ途中で
    不自然に切れない・見出しだけ前ページに残らない）

- [x] **A2. 習得技術が「言語：」に一括表示される → データ補正**（2026-08-25 完了・devDB 22行COMMIT済み。記録: [knowledges](../knowledges/20260825_1330_skill-sheet-category-fix.md)）
  - 箇所: 表示側は正常。`skillSheetPrint.tsx:90-98` `buildSkillSummary()` は分類別
    （言語/FW/DB/OS/インフラ/ツール/その他）に振り分け済み。原因は
    `skillSheetEdit.tsx` の経歴→スキル半自動反映が **category=0（言語）固定で登録していた**こと。
    コード側は 2026-08-25 のサジェスト出し分け改修で修正済み
    （`resolveSkillCategoryByName()`。未コミット）
  - 残作業: **既存データの再分類**。category=0 のシート登録スキルをスキルマスタ
    （canonical_name / alias 照合）と突き合わせ、マスタ側 category へ一括補正する
    （devDBで対象件数を確認してから。マスタ未登録語は補正不能なので画面手直しに委ねる）
  - 確認: 補正後、印刷プレビューで「言語/ツール/DB…」に振り分け表示されること

## B. 改善（見やすさ・提案）

- [x] **B1. フォント縮小の緩和**（2026-08-25 実装完了。print-size-sm廃止・lg/md2段階化）
  - 箇所: `skillSheetPrint.tsx:69-83` `calcPrintSizeClass()` — 経歴件数×300+文字量のスコアで
    lg/md/sm の3段階縮小。sm はかなり小さく「詰めて1枚に収める」設計
  - 方針: A1で改ページを許容する方針に変えるなら、縮小は md までに制限し、
    溢れは改ページで吸収する（読める字サイズを優先）。閾値は実機目視で調整
- [x] **B2. 習得技術サマリーの分類別行分け**（2026-08-25 実装完了。buildSkillSummaryLines化。分類マスタのその他(6)追加とも整合済み）
  - 箇所: `buildSkillSummary()` — 現状は「／」区切りで1連結文字列
  - 方針: 分類ごとに1行（`言語: …` 改行 `ツール: …`）にすると走査しやすい
- [x] **B3. 使用環境・使用技術セルの区切り統一**（2026-08-25 実装完了。splitToChips分解→中黒「・」区切り。狭列で行数が暴れない方を選択）
  - 箇所: `skillSheetPrint.tsx:452-453` — 保存テキストをpre-wrapでベタ表示
  - 方針: 「、」区切りを中黒または改行区切りに整形して視認性を上げる（軽微・任意）

## 対象外（対応済み確認）

- 経歴表ヘッダーのページ跨ぎ再表示: `thead` + `display: table-header-group`
  （`skillSheetPrint.scss:143-144`）で対応済み

## D. ドキュメント

- [x] D1. A2の補正記録 → `docs/knowledges/20260825_1330_skill-sheet-category-fix.md`（済）

## 関連して発覚・対応した事項（2026-08-25）

- [x] **BUG修正: 関連スキル承認タブ白画面** — thyme `GET /ses/skill-master/relations` が
  `{items}` 封筒でなく素配列を返しており、Lavenderの `res.data.items` がundefined→
  `skillRelationApproval.tsx:105` の `list.length` でTypeError。`SesPendingSkillRelationListView`
  新設で封筒化し修正（2026-08-25・未コミット。**実機反映はデプロイ後**）。他エンドポイントに同種不一致なし
- [x] mockの `hasMockProposal()` が決定#37（won/lost/withdrawn後は再登場）に未準拠だった
  不整合を発見・修正（A1除外方式の前提が崩れるため。`MOCK_PROPOSAL_DONE_STATUSES` 追加）
- BUG: 提案管理一覧のモック一覧本体が「読み込み中...」のまま止まる。根本修正必要（未着手）

- [x] 分類マスタ（Lavender `skillSheet.master.ts` SKILL_CATEGORY）に「その他(6)」欠落 →
  スキル・資格タブでその他が選べず保存不能+印刷からその他スキルが消える。**修正・実機検証完了**（2026-08-25）
- [x] スキルシート編集E2E（c5）の既存8件FAILは、2026-08-24決定AB1（経歴タブ先頭化）への
  期待値未追随が真因と特定し、spec側を修正して36件全PASSへ解消（2026-08-25）
- [x] 経験期間表示の統一（「0年」→月表示・null年廃止・3画面共通ヘルパー化。統合環境記録§1由来）
- [x] DDLコメント（両 `schema-ses.sql` の `skill_sheet_skills.category`）に 6:その他 追記済み

## 進め方メモ

- 印刷DOM（`.skill-sheet-print`）はタブ表示中は無条件マウントのため、E2EはDOM検証で足りる
  （`window.print()` 不要。既存E2E知見参照）
- 最終確認は人間の実機目視（印刷プレビュー）が必要

---

# 追加起票: 一覧画面のUI整理（2026-08-25 人間起票）

## A. 仕様変更

- [x] **A1. マッチング一覧の「承認済みかつ提案未作成のみ」トグル（unproposedOnly）を廃止し、
  提案作成済みの組を一覧から除外する**（人間提案 2026-08-25）
  - 現状: `/ses/matchings`・`/personnel/{id}/matches` に unproposedOnly パラメータと画面Switchがある
  - 変更案: 提案が作成された組（hasProposal=true）は**マッチング一覧に出さない**（提案管理側で追う）。
    これによりトグル自体が不要になる
  - 設計メモ:
    - hasProposal は決定#37により「進行中の提案があるときだけ true」。除外方式なら
      won/lost/withdrawn 後は一覧へ自然に再登場し、再提案動線（決定#37の意図）とも整合する
    - 契約変更: unproposedOnly パラメータ廃止（後方互換のため無視 or 400 かは実装時判断）、
      既定で hasProposal=true を除外。phase1-api-contract.md の更新必須
    - メンバー詳細マッチングタブ・全体一覧の両方が対象。判断済み末尾保証行の扱いに注意
    - UnproposedBadge（未提案バッジ）の要否も再検討（除外方式なら一覧に残る承認済みは全て未提案）

- [x] **A2. 商流「貴社所属のみ」（flowLimit=own_only）案件にBP要員をマッチングさせない**
  （人間起票 2026-08-25）
  - 背景: 貴社所属のみの案件に対して他社所属（BP）要員をマッチさせるのは不適切（人間判断）
  - 現状: `checkCommercialFlow`（Lavender `mockData.ts:703-711`）で own_only×BP は
    **NG判定は付くが、マッチング候補としては生成・表示される**
  - 変更案: own_only 案件×BP要員（personnelType≠employee）の組は**マッチング候補を生成しない**
    （NG表示ではなく除外）。自社社員（employee）は従来どおり対象
  - 設計メモ:
    - `own_plus_support`（貴社まで+支援体制相談可）は現行WARNING（要営業確認）のまま候補に残す。
      除外は own_only のみ
    - flowLimit=NULL/unstated は判定材料なしのため従来どおり候補に残す（契約 §flowLimit と整合）
    - マッチング生成側（thyme想定パイプライン）と表示側（Lavender）の両方が対象。
      relink時の再構築でも同ルール適用
    - phase1-api-contract.md のマッチング生成条件への追記必須

- [x] **A3. 不足スキル分析（メンバー詳細マッチングタブ）の見せ方改善**（人間起票 2026-08-25）
  - 対象: `personnelDetail.tsx:578-620` の不足スキル分析カード
  - **確定: 最高単価列は削除**（人間決定 2026-08-25）。単価帯内訳と情報重複・外れ値1件でミスリードするため
  - 単価帯内訳の「1 / 2 / 0 / 3」スラッシュ4連生数字は桁ズレで視認性最悪（人間指摘）→ 表示形式を再設計
  - **方向性（人間の意図）**: 単なる集計表ではなく「このスキルがあれば◯◯がもっとよくなる」という
    メッセージ性を持たせる。SESの待遇軸は実質「単価」と「リモート」の2つ
  - **確定（人間GO 2026-08-25「リモートこみでつくって」）**:
    - 各スキル行を「スキル名＋開ける案件のベネフィット」形式へ
      （例: 「80万円〜の案件が3件・フルリモート案件が2件」のバッジ/一文表示）
    - スラッシュ4連の生数字表・最高単価列・unknown帯表示は廃止
      （「足す動機」にならない数字は出さない。60万未満帯も非表示）
    - API変更: skill-gap集計のitemsから `maxPrice` を削除し、
      `fullRemoteCount`（そのスキルを必須とする案件のうち remoteType=full_remote の件数）を追加。
      bandCountsは維持（表示はover80のみ使用）。thyme+契約書+Lavender同時改修

## B. 表示統一

- [x] **B1. 案件メール一覧のフリーワード入力下の説明文言の扱いを統一**
  - 現状: フリーワード入力の下部説明が**案件メール一覧にだけ**ある
  - 対応: 「不要として削除」or「他の一覧（要員メール一覧等）にも出す」のどちらかに統一。
    **出す場合は入力欄の高さを揃えること**（helperTextの有無で並びの入力欄と高さがズレるため）
  - 判断待ち: どちらに寄せるかは文言の実物とスクショを見て人間が決定

- [x] **B2. 一覧画面のフィルタ入力欄の高さズレ解消（横断）**
  - 症状: input の高さがズレている箇所がちょこちょこある（人間指摘）
  - 対応: 全SES一覧のフィルタ行をスクリーンショットで洗い出し（調査実施中→結果を本ファイルに追記）、
    ズレ箇所を特定して統一（helperText分の高さ・size指定・Switch/Selectとの縦位置合わせ等）

## 進め方メモ

- A1・A2はAPI契約変更（マッチング生成条件含む）を伴うためthyme+Lavender同時改修。B系はLavenderのみ

## B1/B2 スクショ調査結果（2026-08-25 調査完了・リポジトリ未変更）

### B1: フリーワード下部の説明文言の実物

- 存在するのは**案件メール一覧のみ**: `projectList.tsx:277`
  `helperText="案件名・概要・必須/歓迎スキル・勤務地から検索します"`
- 姉妹画面の要員メール一覧（`staffList.tsx:270-278`）・メンバー一覧・マッチング一覧・
  提案管理一覧のフリーワード欄にはhelperTextなし
- **判断待ち（人間）**: 削除 or 横展開のどちらに寄せるか

### B2: 高さズレの実測結果

- 実害のあるズレは**1箇所のみ**: `projectList.tsx:268` の
  `<Grid container spacing={2} alignItems="center">` 行。helperText付きのフリーワード欄だけ
  総高さが増え、入力枠が兄弟要素より**約12〜14px浮く**（Playwright実測: フリーワード
  top=228.5px vs ステータス top=240.5px）
- マッチング一覧 `matchingList.tsx:300-307`・提案管理 `proposalList.tsx:157-162` の
  TextField+Switch混在行は上端差1〜2pxで実害なし
- **原因**: `alignItems="center"` の行内でhelperTextの有無により欄の総高さが異なると
  中央基準がズレる構造的問題
- **修正パターンは社内確立済み**: `skillSheetEdit.tsx:1381,1576` で同一原因を
  `alignItems="flex-start"`（上端揃え）で修正済み・コメント付き。`projectList.tsx:268` に横展開すればよい
- 補足: B1でどちらを選んでも flex-start 対応は別途必要（文言を消しても同種のhelperText付き欄が
  増えれば再発するため）
- 発見した別件: 提案管理一覧のモック一覧本体が「読み込み中...」のまま止まる既知問題あり
  （フィルタ行実測には影響なし。BUG: モックデータ未応答。根本修正必要）
- スクショ調査の結果（対象画面・ズレ箇所一覧）はこのファイルの下に追記する

