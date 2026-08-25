# skill_sheet_skills の category=0 固定バグのデータ補正

## Summary

経歴→スキル半自動反映が category=0（言語）固定で登録していたバグ（コードは2026-08-25修正済み）の
既存データを、devDBでマスタ正名照合により一括補正した（2026-08-25・人間GO済み）。

## Verbatim

- 対象: `ses.skill_sheet_skills` で `category=0` かつ `LOWER(TRIM(name))` が `skills.canonical_name` に
  一致し、マスタ側 category が非0の行
- UPDATE件数: **22件**（ドライランで事前確認・件数/分布ガード付きで本実行）
- 補正後分布: 言語22 / FW19 / DB13 / OS9 / インフラ8 / ツール20 / その他2
- 残る category=0 22件の内訳: 正しく言語の行（Java 17 (LTS)・TypeScript 5.4・Python 3.12 等の
  バージョン付き表記含む）。マスタ未一致で手直しが要るのは「tomcat」1件のみ（マスタ未登録のため）
- alias（skill_aliases.alias_text）照合での追加補正対象は0件だった

## Source

- devDB dev.2-way.co.jp/ses 2026-08-25実施。印刷プレビューのタスクリスト
  `docs/development/20260825_1256_print-preview-tasks.md` A2 の残作業として実施

## Usage

- 印刷プレビューの習得技術サマリーが分類別（言語/ツール/DB…）に正しく振り分け表示されるようになる
- 「tomcat」はスキルマスタ登録（または本人の画面手直し）で解消する。登録待ちスキルAI判定の導入後は
  そちらの経路でも拾える
