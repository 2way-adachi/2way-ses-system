# データモデル

MVP向けの論理データモデルを整理する。

- 作成日: 2026-08-03
- 更新日: 2026-08-17（要員メール、メンバー、マッチング、提案管理を反映）
- **ステータス: 本データモデルは確定仕様ではなく、MVP開始時点の案である。** 工程1（仕様固定）で見直す前提とする。

## 0. 配置方針（2026-08-04 決定）

| 項目 | 決定 |
|------|------|
| バックエンドAPI | 既存の **thyme**（Spring Boot）に相乗りする |
| DB | fukuroに同居させず、**SES用のスキーマを新設する** |

補足：

- MySQLではスキーマ＝データベースのため、同一インスタンス上にSES用スキーマを作る想定
- スキーマが分かれるため、テーブル名の `ses_` プレフィックスは**不要**
- 権限判定などでLavenderの管理ユーザー情報が必要な場合は、**API層で解決する**（2026-08-04 決定）。
  スキーマをまたぐJOINは行わない。SES側のテーブルからLavender側のテーブルへ外部キーを張らない
  （`skill_sheet_drafts.manage_user_id` も参照制約なしのIDとして保持する）

詳細は [Lavender組み込み要件](../requirements/lavender-integration.md) を参照。

---

## 1. エンティティ一覧

| テーブル / エンティティ | 概要 |
|------------------------|------|
| `skill_sheets` | スキルシート本体（基本情報、自己PR） |
| `skill_sheet_careers` | 職歴 |
| `career_phases` | 職歴ごとの担当工程 |
| `skill_sheet_skills` | スキル（スキル名を直接保持） |
| `qualifications` | 資格 |
| `skill_sheet_drafts` | スキルシート編集中の下書き |
| `projects` | 案件メールから取得した案件 |
| `staff_candidates` | 要員メールから取得した要員 |
| `members` | 営業管理対象のメンバー |
| `matchings` | 案件と要員またはメンバーのマッチング結果 |
| `proposals` | 承認済みマッチングを起点とした提案管理 |
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
- desired_unit_price_min
- desired_unit_price_max
- preferred_location
- remote_preference
- self_pr
- status
- create_datetime
- update_datetime

補足：

- 年齢は保持せず、`birth_date` から算出する
- 社員番号は4桁（実データは2桁。拡張を見越して4桁で確保）
- 希望単価は数値（円/月）の上下限で保持し、案件の単価と比較できるようにする
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

補足：

- 作成日時・更新日時は親（`skill_sheets`）のみが持つ
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

### 2.4 skill_sheet_skills

候補項目：

- id
- skill_sheet_id
- display_order
- name
- category
- experience_months
- last_used_date
- remarks

補足：

- **スキルマスタは持たない**（2026-08-05 決定）。スキル名を直接保持する
  - 画面がスキル名を自由入力とするため、マスタを設けても形骸化する
  - マッチングも文字列比較を前提とする
  - 表記ゆれは許容する。将来マスタ化する余地は残す
- `experience_months` / `last_used_date` の自動集計はMVPでは必須としない
- 職歴ごとの使用技術は `skill_sheet_careers.technology` に文字列で保持する

### 2.5 qualifications

候補項目：

- id
- skill_sheet_id
- name
- acquired_date
- remarks
- display_order

### 2.6 skill_sheet_drafts

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
- **`skill_sheet_id` は NOT NULL**。新規作成中は自動保存を行わないため、対象スキルシートが
  存在しない下書きは発生しない（2026-08-04 決定）
- 一意制約は `(skill_sheet_id, manage_user_id)`

### 自動保存の適用範囲（2026-08-04 決定）

| 状態 | 自動保存 |
|------|---------|
| 新規作成中（未保存） | **行わない** |
| 手動保存後の再開（編集） | **行う** |

新規作成時は、利用者が「保存する」で正式保存するまで下書きを作らない。
一度正式保存されたスキルシートを編集する場面から、1分おきの自動保存が有効になる。

---

## 3. 案件・要員メール系

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
- `required_skills_text` は抽出元の文字列を保持し、マッチングで比較に利用する

### 3.2 staff_candidates

要員メールから取得した要員情報を保持する。

候補項目：

- id
- name_initial
- mail_subject
- original_body
- skills_text
- nearest_station
- affiliation
- unit_price_min
- unit_price_max
- start_date
- sender
- received_at
- source_mail_id
- member_id
- created_at
- updated_at

補足：

- 要員メール由来の情報は、メンバー正本とは分けて保持する
- `member_id` はメンバー化済みの場合に紐づける。未紐づけの要員候補も保持できるようにする
- `skills_text` は抽出元の文字列を保持し、マッチングで比較に利用する

### 3.3 members

メンバー一覧、メンバー詳細の正本となる情報を保持する。

候補項目：

- id
- skill_sheet_id
- name
- name_initial
- gender
- birth_date
- nearest_station
- affiliation
- unit_price_min
- unit_price_max
- start_date
- status
- created_at
- updated_at

補足：

- スキルシートは `skill_sheet_id` で紐づけ、メンバー詳細の「スキルシート」タブで表示する
- infoタブ、提案タブ、マッチングタブは `members.id` を起点に関連情報を取得する

### 3.4 matchings

案件と要員またはメンバーのマッチング結果を保持する。

候補項目：

- id
- project_id
- staff_candidate_id
- member_id
- score
- status
- reason
- matched_skills_text
- missing_skills_text
- memo
- created_at
- updated_at

補足：

- `status` は確認待ち、承認済み、見送りなどを表す
- マッチング一覧から行を押下した場合、`member_id` を使ってメンバー詳細のマッチングタブを表示する
- 承認済みのマッチングは提案管理の対象になる

### 3.5 proposals

承認済みマッチングを起点とした提案状況を保持する。

候補項目：

- id
- matching_id
- member_id
- project_id
- status
- proposal_to
- contact_email
- next_action_date
- memo
- mail_subject
- mail_body
- sent_at
- created_at
- updated_at

補足：

- `status` は提案メール送信済み、1回目面談、2回目面談、先方返信待ち、完了、見送りなどを表す
- 提案管理一覧から行を押下した場合、`member_id` を使ってメンバー詳細の提案タブを表示する
- `next_action_date` は提案管理一覧、メンバー詳細の提案タブで表示、更新する

### 3.6 mail_import_histories

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
members 1 --- 0..1 skill_sheets 1 --- * skill_sheet_careers 1 --- * career_phases
             +--- * skill_sheet_skills   （スキル名を直接保持。マスタなし）
             +--- * qualifications
             +--- * skill_sheet_drafts   （ユーザー×シート単位。正式保存/キャンセルで削除）

projects         （案件メールから登録）
staff_candidates （要員メールから登録。メンバーへ紐づけ可能）
members 1 --- * matchings  * --- 1 projects
members 1 --- * proposals  * --- 1 projects
matchings 1 --- 0..1 proposals
mail_import_histories （取り込み実行履歴）
```

就業状況・勤怠提出元は `skill_sheets` に持たず、`skill_sheet_careers` から導出する。

マッチングは `projects.required_skills_text` と `staff_candidates.skills_text` または
メンバーのスキルシート情報を比較して算出する。

---

## 5. 未確定事項

- `attendance_submission_source` の必須入力条件
- Excelインポート時、範囲表記の希望単価（例「65〜70万」）をどう数値化するか

### 決定済み（2026-08-05）

物理データモデルを確定した。DDLは thyme の `docs/ddl/schema-ses.sql` を参照。

| 論点 | 決定 |
|------|------|
| 年月項目（`yyyy-mm`） | `date` 型。日は01固定 |
| 作成日時・更新日時 | 親テーブルのみ保持（`skill_sheets` 等）。子テーブルは持たない |
| 担当工程 | `career_phases` テーブルで正規化（Boolean列案は不採用） |
| スキルマスタ | **持たない**。スキル名を直接保持 |
| 下書きの `content` | `json` 型（MySQL 5.7.44 で利用可） |
| 単価 | 数値（円/月）の上下限。`desired_unit_price_min` / `max` |
| 論理削除 | **行わない**（物理削除）。`skill_sheets.status` は 0:下書き / 1:公開 |
| 社員番号 | 4桁（実データ2桁。拡張分を確保） |
| 外部キー制約 | 張らない（既存fukuroに準拠）。整合性はアプリ側で担保 |

DB製品はMySQL 5.7.44（thymeが接続する既存環境に合わせる）。

---

## 関連ドキュメント

- [MVP要件定義](../requirements/mvp-requirements.md)
- [Lavender組み込み要件](../requirements/lavender-integration.md)
- [スキルシート要件](../requirements/skill-sheet-requirements.md)
- [画面設計](screen-design.md)
