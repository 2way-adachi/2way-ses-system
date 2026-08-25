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
