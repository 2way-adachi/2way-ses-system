# 2way-ses-system

SES事業向けの補助システム。スキルシートと案件情報をWeb上で一元管理する。

**本システムは独立サービスではなく、既存の管理画面Lavender（2way Manage system）の1機能として追加する。**
Lavenderのサイドバーに、FUKURO2.0とは別の大項目「SES」を新設し、その配下に「スキルシート」「案件一覧」を配置する。

→ [Lavender組み込み要件](docs/requirements/lavender-integration.md)

---

## システム概要

現在、スキルシートはExcel、案件情報はメールで管理されており、以下の課題がある。

- 情報がファイルやメールに分散している
- 最新版が分かりにくい
- 検索や一覧化が難しい
- 案件と人材情報を横断的に利用できない
- スキルシートの更新や共有に手間がかかる

本システムは、これらの情報をDBへ格納し、ブラウザ上から管理可能にする。

## MVPの目的

MVPの中心は次の2軸とする。

1. **スキルシート管理システム**
2. **案件メールからの案件情報格納自動化**

マッチング機能は本格実装せず、DB化したデータを利用できることを確認するための簡易機能として扱う。

## 主要機能

### スキルシート管理

- 一覧、詳細、新規作成、編集
- 職歴、スキル、資格、自己PRの管理
- 既存Excelからの初期取り込み
- PDF表示またはPDF出力

### 案件情報管理

- メールサービスとの接続、対象メールの取得
- 案件情報の抽出とDB登録（重複登録防止）
- 案件の一覧、詳細、編集
- メール取り込み履歴の確認

### 仮マッチング（余力がある場合のみ）

案件の必須スキル文字列とスキルシートの技術情報を単純比較し、一致件数順に候補者を表示する。

## MVP対象外

- 高精度なAIマッチング、機械学習
- 複数Excelフォーマットへの対応
- Excelへの再出力
- 請求 / 契約 / 勤怠 / 営業管理
- 承認ワークフロー、詳細な変更履歴比較、複雑な権限管理
- メールへのPDF自動添付、リアルタイムメール受信

## 基本方針

- **Lavenderの1機能として追加する。** 独立サービスとして作らず、認証・共通レイアウトは既存を利用する
- **DB上の情報を正本とする。** スキルシートは移行後、ブラウザ上で新規作成、参照、編集する
- **Excelは既存スキルシートの初期移行元としてのみ利用する。** Excelへの再出力は行わない
- **外部提出、メール添付、印刷が必要な場合はPDFを利用する**
- MVPでは複数種類のExcelフォーマットに対応せず、確認済みの自社スキルシート形式1種類のみを対象とする

---

## ディレクトリ構成

```text
2way-ses-system/
├─ README.md
├─ docs/
│  ├─ requirements/
│  │  ├─ mvp-requirements.md
│  │  ├─ lavender-integration.md
│  │  └─ skill-sheet-requirements.md
│  ├─ design/
│  │  ├─ screen-design.md
│  │  └─ data-model.md
│  └─ development/
│     └─ team-responsibilities.md
├─ frontend/        # ※Lavender組み込み方針への変更により、用途を再検討中
├─ backend/         # ※API配置が未確定のため、用途を再検討中
└─ infrastructure/  # インフラ関連（未着手）
```

> **注記**: フロントエンドの実装先はLavender（`2way_repository/Lavender`）である。
> バックエンドの配置は未確定。本リポジトリをドキュメント専用にするかを含め、工程1で決定する。

## ドキュメント

| ドキュメント | 内容 |
|-------------|------|
| [MVP要件定義](docs/requirements/mvp-requirements.md) | システム概要、対象 / 対象外機能、完成条件 |
| [Lavender組み込み要件](docs/requirements/lavender-integration.md) | サイドバー構成、ルーティング、技術スタック、影響範囲 |
| [スキルシート要件](docs/requirements/skill-sheet-requirements.md) | 管理項目、PDF、Excelインポート方式 |
| [画面設計](docs/design/screen-design.md) | 画面一覧と各画面の表示項目、操作 |
| [データモデル](docs/design/data-model.md) | MVP時点の論理データモデル案 |
| [開発体制と役割分担](docs/development/team-responsibilities.md) | 3人体制の担当分割と開発工程 |

---

## 確定事項

Lavender組み込み方針への変更により確定した。

- フロントエンド技術スタック → Lavender既存（React 17 / TypeScript / Material-UI v4 / Redux Toolkit）
- 認証、ユーザー管理 → Lavender既存のログイン機構
- 共通レイアウト → Lavender既存のAppBar・Drawer・Container

## 未確定事項（TODO）

工程1（仕様固定）で決定する。上2つが最優先。

- [ ] **バックエンドAPIの配置**（既存thymeに相乗りか、SES用に別APIか）
- [ ] **DBの配置**（fukuroデータベースに同居か、別DB／別スキーマか）
- [ ] SESメニューの表示制御（権限による出し分けの要否）
- [ ] 本リポジトリの役割（ドキュメント専用にするか）
- [ ] パス命名規約（ケバブケースへの統一）
- [ ] 対象メールサービスと対象メールの判定条件
- [ ] 対象Excelフォーマットの項目、セル位置の確定
- [ ] PDF生成方式（印刷用HTML方式か専用基盤か）

## ステータス

初期ドキュメント整備フェーズ。実装は未着手。
