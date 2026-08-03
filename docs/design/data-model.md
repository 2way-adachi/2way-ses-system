# データモデル

MVP向けの論理データモデルを整理する。

- 作成日: 2026-08-03
- **ステータス: 本データモデルは確定仕様ではなく、MVP開始時点の案である。** 工程1（仕様固定）で見直す前提とする。

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
- employment_status
- attendance_submission_source
- desired_unit_price
- preferred_location
- remote_preference
- career_change_intention
- self_pr
- status
- created_at
- updated_at

補足：

- 年齢は保持せず、`birth_date` から算出する
- 住所は `prefecture` / `city` / `nearest_station` に分割して保持する
- `attendance_submission_source` は参画中メンバーの勤怠提出元を保持する。候補値は `upper_company` / `current_member` を想定する

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
- environment
- remarks
- created_at
- updated_at

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

projects              （案件。メール取り込みにより登録）
mail_import_histories （取り込み実行履歴）
```

仮マッチングは `projects.required_skills_text` と `skill_sheet_skills` / `skills` を単純比較して算出する。

---

## 5. 未確定事項

- 物理データモデル（型、桁、NULL制約、インデックス）
- 論理削除の要否と方式
- `status` の取りうる値
- `attendance_submission_source` のNULL許容条件と未参画時の扱い
- 単価の単位と表現（月額 / 時間単価、税区分）
- DB製品の選定

---

## 関連ドキュメント

- [MVP要件定義](../requirements/mvp-requirements.md)
- [スキルシート要件](../requirements/skill-sheet-requirements.md)
- [画面設計](screen-design.md)
