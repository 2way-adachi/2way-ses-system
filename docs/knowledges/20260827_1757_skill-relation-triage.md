# 関連スキル承認待ち780件の一括トリアージ（2026-08-27）

## Summary

skill_relations の LLM生成承認待ち780件を人間承認の推奨案に基づき一括処理。
承認758（うち2件はrelation_type修正のうえ承認）・却下22。承認済みが0→758になり、
スキルシート編集のChipサジェスト（タスクY2）が初めて実際に機能する状態になった。
関連リンクはマッチング未使用（Y3保留）のため relink 等の後続作業は不要。

## Verbatim

実行結果: `却下=22 type修正承認=2 承認=756 合計=780`
最終分布: status=1: 758 / status=2: 22（status=0: 0）

却下22件のid: 749, 244, 221, 216, 118, 178, 546, 779, 780, 639, 638, 637, 642, 654,
339, 345, 116, 704, 721, 766, 767, 514
type修正（broader→related）: 246（Windows⊂Windows Server）, 385（Dell⊂ストレージ）

## 振り分け方針（今後の関連トリアージ基準として再利用可）

- **承認**: 同一スタックの共起（Java→Spring等）・正しい上位概念（VPC⊂AWS等）・
  **競合製品ペアも承認**（AWS↔Azure、Angular↔React等。「片方を使う人はもう片方も経験がち」で
  登録漏れ喚起に有効、Chipは無視できる控えめUIのため。人間確認済み 2026-08-27）
- **却下**: 明白な誤関連（Jest→Java、Sourcetree→SVN）・誤階層（Confluence⊂M365、
  VNet Peering⊂VPC）・ベンダー系統違い（AIX→HPサーバ、mcframe⊂SAP）・
  文脈不一致（3Dデザイン→Open3D、ローコード↔ノーコードWeb制作）
- **誤階層だが提示自体は有用な行**: 却下せず relation_type=0(related) に直して承認
  （却下すると再生成バッチが再提案しなくなり、有用な提示まで失われるため）

## Source

- devDB `ses` スキーマ 2026-08-27 17:45頃 JST 適用（人間`!`実行・件数ガード+ROLLBACK付き）
- 人間承認: 「トリアージやるか」→推奨案（却下22全明細+競合ペア承認方針）提示→「その内容でOK」
- 実行スクリプト: scratchpad/apply_relation_triage.py（セッション消滅注意・本記録が正）
- 設計の意図: [関連スキルサジェスト設計](../design/20260821_1442_skill-relation-suggest.md)

## Usage

- 関連PJ: thyme（related/pending/decision API）/ Lavender（skillSheetEdit Chip・skillRelationApproval）
- Chipが出る条件: スキルシート編集でAutocompleteの**マスタ候補を選択した時のみ**（自由入力語は対象外・
  シート既存語は非表示）。承認済み関連を両方向に引く
- 今後LLM再生成（POST /ses/skill-master/relations/generate）すると新規候補は承認待ちで入る。
  却下行は記憶として残り再提案されない
