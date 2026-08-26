# 頻度20以上の未登録スキル一括トリアージ（2026-08-26）

## Summary

unknown_terms の freq>=20・status=0 の98語+IaC を人間承認の推奨案に基づき一括処理。
skills 238→293語（+50、IaCは人間が画面登録）、別名+22、却下29語。
保留4語（経理・PLG・DPA・MA）は判断材料不足のため status=0 のまま。
SQL直投入のため**案件への再照合（relink）が未実施** → relink+skill-years-backfill の実行が必要。

## Verbatim

実行結果: `COMMIT: 登録50 別名22 unknown削除70 却下29`
検証: skills総数293 / カテゴリ分布 (0:26, 1:38, 2:19, 3:9, 4:69, 5:86, 6:46) / freq>=20残pending 9
（保留4+スナップショット後の新規到達5: Glue/Spring Batch/Tomcat/Rocky Linux/ロードマップ策定）

## 振り分け方針（今後のトリアージ基準として再利用可）

- **登録**: 具体的な技術・製品・ドメイン専門領域（言語/FW/DB/OS/インフラ製品/ツール/概念語）。
  概念語は既存の同格語との整合で判断（例: RDB→ベクタDBが2にいる/IaC→インフラ4/中国語→英語が6にいる）
- **別名**: 既存正規名の表記ゆれ・ベンダープレフィックス差（Amazon CloudWatch→CloudWatch等）・
  バージョン違い（Windows Server 2025→Windows Server）
- **却下**: 工程語（設計・単体テスト等）・役割語（PJ統括・バックエンド等）・ソフトスキル
  （コミュニケーション力等）・既存語で拾える下位語（VLOOKUP→Excel）。マッチング判定に使えないため
- 運用系製品（Backup Exec/JP1系）はカテゴリ5ツール（JP1/HULFTの既存整合）

## Source

- devDB `ses` スキーマ（dev.2-way.co.jp）2026-08-26 09:30-09:50 JST 実測
- 実行スクリプト: scratchpad/skill_maintenance_20260826.py（セッション消滅注意・本記録が正）
- 人間承認: 2026-08-26「頻度20以上の未登録スキル、振り分けの推奨教えて」→「データメンテしておいて」

## Usage

- 関連PJ: 2way-ses-system / thyme（スキルマスタ）/ Lavender（トリアージ画面）
- **relink実行済み**（2026-08-26 ローカルthyme経由）: projects=3899, tagged=3350, links=15529。
  新スキルのタグ実績: IaC 128案件・品質管理65・dbt 48・Fortinet 41 ほか
- **skill-years-backfill実行済み**（同・gpt-5.6-luna）: 2,922通全件処理・失敗0・updatedRows=10、
  required_years付き行474→484。コスト実績≒$1.7前後
  - 注意: ローカルthymeはSES_OPENAI_API_KEYがenv参照で空のため、キー無し起動だと全件failedで空振りする
    （aborted=true「OpenAI APIキーが未設定です」）。キーを環境変数に入れて起動すること
- **実行方式の知見**: 管理者APIはローカルthyme（devDB向き・port 8082）+ POST /login のJWTで叩ける。
  認証情報は人間が`!`でログインスクリプト実行（creds.txtは読み取り後即削除）
- **残作業**: ①保留4語の人間判断（経理/PLG/DPA/MA）②IaC⇄Terraform/Ansible/CloudFormation/CDKの
  関連スキルリンク（関連リンク生成 or 手動）
