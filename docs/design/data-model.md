# データモデル

MVP向けの論理データモデルを整理する。

- 作成日: 2026-08-03
- 更新日: 2026-08-04（Lavender組み込み方針を反映）
- **ステータス: 本データモデルは確定仕様ではなく、MVP開始時点の案である。** 工程1（仕様固定）で見直す前提とする。

## 0. 配置方針（2026-08-04 決定）

| 項目 | 決定 |
|------|------|
| バックエンドAPI | 既存の **thyme**（Spring Boot）に相乗りする |
| DB | fukuroに同居させず、**SES用のスキーマを新設する** |

補足：

- MySQLではスキーマ＝データベースのため、同一インスタンス上にSES用スキーマを作る想定
- スキーマが分かれるため、テーブル名の `ses_` プレフィックスは**不要**
- 権限判定などでLavenderの管理ユーザー情報を参照する場合、スキーマをまたぐ参照になる。
  結合するか、API層で解決するかは物理設計時に決める

詳細は [Lavender組み込み要件](../requirements/lavender-integration.md) を参照。

---

## 1. エンティティ一覧

| テーブル / エンティティ | 概要 |
|------------------------|------|
| `skill_sheets` | スキルシート本体（基本情報、自己PR） |
| `skill_sheet_careers` | 職歴 |
| `career_phases` | 職歴ごとの担当工程 |
| `skills` | スキルマスタ |
| `skill_sheet_skills` | スキルシートとスキルの関連 |
| `career_skills` | 職歴とスキルの関連 |
| `qualifications` | 資格 |
| `skill_sheet_drafts` | スキルシート編集中の下書き |
| `projects` | 案件 |
| `mail_import_histories` | メール取り込み履歴 |

---

## 2. スキルシート系

### 2.1 skill_sheets

候補項目：

- id
- employee_code
- name
- name_kana
- gender
- birth_date
- prefecture
- city
- nearest_station
- education
- desired_unit_price
- preferred_location
- remote_preference
- self_pr
- status
- created_at
- updated_at

補足：

- 年齢は保持せず、`birth_date` から算出する
- 住所は `prefecture` / `city` / `nearest_station` に分割して保持する
- **就業状況は保持しない。** 職歴の `is_current` と `end_date` から算出する（下表）
- **勤怠提出元は保持しない。** 職歴ごとの項目として `skill_sheet_careers` に持つ
- **転職意向はMVPの管理対象外。** 入力項目から削除したため列を持たない

### 就業状況の算出

| 職歴の条件 | 就業状況 |
|-----------|---------|
| `is_current = true` かつ `end_date IS NULL` | 稼働中 |
| `is_current = true` かつ `end_date IS NOT NULL` | 稼働中（終了予定あり） |
| `is_current = true` の職歴が無い | 待機中 |

### 2.2 skill_sheet_careers

候補項目：

- id
- skill_sheet_id
- display_order
- start_date
- end_date
- is_current
- project_name
- description
- role
- team_size
- attendance_submission_source
- environment
- remarks
- created_at
- updated_at

補足：

- `attendance_submission_source` は**職歴ごと**の勤怠提出元。候補値は `upper_company` / `current_member`
- 過去職歴にも値を保持する
- 一覧表示・検索では、`is_current = true` の職歴、無ければ最新の職歴の値のみを対象とする
  （過去の全職歴を横断検索しない）

### 2.3 career_phases

候補項目：

- id
- career_id
- phase_type

`phase_type` の候補値：要件定義 / 基本設計 / 詳細設計 / 設計構築 / 製造 / テスト / 運用保守 / サポート

> MVPで実装を簡略化する場合は、担当工程を `skill_sheet_careers` にBoolean列として保持する案も許容する。

### 2.4 skills

候補項目：

- id
- name
- category
- created_at
- updated_at

### 2.5 skill_sheet_skills

候補項目：

- id
- skill_sheet_id
- skill_id
- experience_months
- last_used_date
- remarks
- display_order

補足：

- `experience_months` / `last_used_date` の自動集計はMVPでは必須としない

### 2.6 career_skills

候補項目：

- id
- career_id
- skill_id

### 2.7 qualifications

候補項目：

- id
- skill_sheet_id
- name
- acquired_date
- remarks
- display_order

### 2.8 skill_sheet_drafts

スキルシート編集中の下書きを保持する。**下書きはDBに保存する**（2026-08-04 決定）。

候補項目：

- id
- skill_sheet_id
- manage_user_id
- content
- created_at
- updated_at

補足：

- **保持単位はユーザー×スキルシート**（2026-08-04 決定）。同一ユーザーが同一スキルシートを編集中の下書きは常に1件
- `content` には編集画面の入力内容（基本情報・スキル・資格・職歴・自己PR）を**JSONで丸ごと保持する**
  - 項目追加のたびにテーブル定義を変えずに済むため
  - 下書きに対する検索要件がないため、JSON内を検索できなくても支障がない
- 正式保存時・キャンセル時に該当レコードを削除する
- 1分おきの自動保存は、同一レコードへの上書き（UPSERT）とする
- `manage_user_id` は編集操作を行ったログインユーザー。管理者が他人のスキルシートを編集した場合、
  下書きは**編集した本人のもの**として保持する

> **要検討**: 新規作成中は対象スキルシートがまだ存在しないため `skill_sheet_id` が定まらない。
> NULL許容とする場合、`(skill_sheet_id, manage_user_id)` の一意制約が新規作成分に効かない。
> 新規作成用の下書きをどう一意に識別するかは物理設計時に決める。

---

## 3. 案件系

### 3.1 projects

候補項目：

- id
- title
- mail_subject
- original_body
- required_skills_text
- location
- unit_price_min
- unit_price_max
- start_date
- sender
- received_at
- source_mail_id
- created_at
- updated_at

補足：

- `source_mail_id` を重複登録防止のキーとして利用する想定
- `required_skills_text` は抽出元の文字列を保持し、仮マッチングで単純比較に利用する

### 3.2 mail_import_histories

候補項目：

- id
- executed_at
- status
- success_count
- failure_count
- error_message

---

## 4. 関連イメージ

```text
skill_sheets 1 --- * skill_sheet_careers 1 --- * career_phases
             |                          |
             |                          +--- * career_skills * --- 1 skills
             +--- * skill_sheet_skills * --- 1 skills
             +--- * qualifications
             +--- * skill_sheet_drafts   （ユーザー×シート単位。正式保存/キャンセルで削除）

projects              （案件。メール取り込みにより登録）
mail_import_histories （取り込み実行履歴）
```

就業状況・勤怠提出元は `skill_sheets` に持たず、`skill_sheet_careers` から導出する。

仮マッチングは `projects.required_skills_text` と `skill_sheet_skills` / `skills` を単純比較して算出する。

---

## 5. 未確定事項

- 物理データモデル（型、桁、NULL制約、インデックス）
- 論理削除の要否と方式
- `status` の取りうる値
- `attendance_submission_source` の必須条件とNULL許容の扱い
- `skill_sheet_drafts` の新規作成中レコードの一意識別方法（2.8参照）
- スキーマをまたぐ管理ユーザー参照の解決方法（結合するか、API層で解決するか）
- 単価の単位と表現（月額 / 時間単価、税区分）

DB製品は、thymeが接続する既存環境に合わせてMySQLとする。

---

## 関連ドキュメント

- [MVP要件定義](../requirements/mvp-requirements.md)
- [Lavender組み込み要件](../requirements/lavender-integration.md)
- [スキルシート要件](../requirements/skill-sheet-requirements.md)
- [画面設計](screen-design.md)
