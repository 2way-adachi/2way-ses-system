# データモデル

MVP向けの論理データモデルを整理する。

- 作成日: 2026-08-03
- 更新日: 2026-08-17（要員メール、メンバー、マッチング、提案管理を反映。同日、スキルシート系へ実装確定分を反映）
- **ステータス: スキルシート系（2章）は物理DDL確定・実装済み。3章（メンバー・マッチング・提案系）は案であり、実装済みDDLと乖離がある**（3章の注記参照）。

> 物理DDLは thyme `docs/ddl/schema-ses.sql`（17テーブル統合版、2026-08-09統合）が現状の正。
> 実装との対応は [実装現状の記録](../development/implementation-status.md) を参照。

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
- attendance_submission_source
- self_pr
- status
- create_datetime
- update_datetime

補足：

- 年齢は保持せず、`birth_date` から算出する
- 社員番号は4桁（実データは2桁。拡張を見越して4桁で確保）。重複不可
- 希望単価は数値（円/月）の上下限で保持し、案件の単価と比較できるようにする。
  **API・画面上は万円/月で扱い、保存時に円へ換算する**
- 住所は `prefecture` / `city` / `nearest_station` に分割して保持する
- `gender` / `birth_date` / `prefecture` / `city` は必須（NOT NULL。2026-08-12決定）
- **就業状況は保持しない。** 職歴の `is_current` と `end_date` から算出する（下表）
- **勤怠提出元は`skill_sheets`のシート単位で保持する**（2026-08-12決定。当初の職歴単位から変更）。
  任意入力（NULL可）。用途は最新の稼働状況の把握のみで、過去現場ごとの値は持たない
- `status` は 0:未公開 / 1:公開済み。利用者が切り替えるフラグではなく「一度も公開されていない／公開済み」の導出状態
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
- career_type
- start_date
- end_date
- is_current
- project_name
- description
- role
- team_size
- environment
- technology
- remarks

補足：

- 作成日時・更新日時は親（`skill_sheets`）のみが持つ
- `career_type` は経歴区分（0:経験者 / 1:未経験）。**経験月数の算出は経験者の職歴のみを合算する**
- 勤怠提出元はこのテーブルには持たない（2026-08-12に `skill_sheets` のシート単位へ変更。2.1参照）
- `technology` は職歴ごとの使用技術（文字列）

### 2.3 career_phases

候補項目：

- career_id
- phase_type

`career_id` + `phase_type` の複合主キー（id列は持たない）。

`phase_type` の候補値：0:要件定義 / 1:基本設計 / 2:詳細設計 / 3:設計構築 / 4:製造 / 5:テスト / 6:運用保守 / 7:サポート

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

- **スキルシートのスキルはマスタを持たない**（2026-08-05 決定）。スキル名を直接保持する
  - 画面がスキル名を自由入力とするため、マスタを設けても形骸化する
  - 表記ゆれは許容する。将来マスタ化する余地は残す
- なお実装済みのマッチングは、スキルシートとは独立の**スキルマスタ（`skills` / `skill_aliases`）を新設済み**
  で、本節の「文字列比較」前提とは異なる（[実装現状の記録](../development/implementation-status.md)。要すり合わせ）
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
- キャンセル時は編集者本人の下書きを削除する。**正式保存時はユーザーを問わず該当シートの下書きを全件削除する**（サーバー側で実施）
- 1分おきの自動保存は、同一レコードへの上書き（UPSERT）とする
- `content` の中身はフロント規約 `{ formatVersion, savedAt, inputs }`。サーバーは形を検証せず、そのまま往復させる
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

## 3. 案件・要員メール系／メンバー・マッチング・提案系

> **実装状況（2026-08-17更新）**: すり合わせ方針（下記）は**実装・devDB適用済み**。
> `personnel` に skill_sheet_id（UNIQUE）/ name_initial / gender / birth_date を追加し、
> `matchings`（承認状態のみ）と `proposals.matching_id` を新設した。物理はDDL（thyme `docs/ddl/schema-ses.sql`）が正。
> 本章の `members` 節は「personnelへ取り込み済みの項目案」として履歴的に残す。
> メール系（`mails` / `staff_candidates` / `mail_import_histories`）はテーブル定義のみでAPI・バッチ未実装。
>
> **すり合わせ方針（2026-08-17 決定・要チーム共有）**:
> `members` を新設せず、**本章 3.3 の項目を既存 `personnel` に取り込んで拡張**する。
> `matchings` は**承認状態（確認待ち／承認済み／見送り）を保持するためだけの薄いテーブル**とし、
> スコア・一致スキルは永続化せず**都度計算のまま**（結果テーブルの鮮度管理問題を避けるため）。
> 提案作成時に `proposals.match_snapshot` へ凍結する現行方式は維持する。

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
- interview_done_count
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

- `status` は **下書き／提案メール送信済み／面談／先方返信待ち／完了／見送り／取下げ**（2026-08-17確定）
  - 「1回目面談」「2回目面談」のような固定値は持たない。面談は1値とし、
    `interview_done_count`（実施済み面談回数）を別カラムで保持する。
    案件側の面談回数（予定）と組み合わせて「面談（2/3回目）」のように表示する
- `next_action_date` は追加で確定（2026-08-17）
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

就業状況は `skill_sheets` に持たず、`skill_sheet_careers` から導出する。
勤怠提出元は `skill_sheets` のシート単位で保持する（2026-08-12変更）。

マッチングは `projects.required_skills_text` と `staff_candidates.skills_text` または
メンバーのスキルシート情報を比較して算出する。

---

## 5. 未確定事項

- 決着済み: `matchings` のカラム設計・承認/見送りUI → **確定（2026-08-17。下記）**

### matchings 確定設計（2026-08-17）

```text
matchings
  matching_id     PK
  project_id      案件（参照制約なし）
  personnel_id    要員（参照制約なし）
  status          0:確認中 / 1:承認済み / 2:見送り
  reject_reason   見送り理由（任意・NULL可）
  memo            任意
  decided_at / decided_by   承認・見送りの操作日時と操作者（manage_user_id、参照制約なし）
  UNIQUE (project_id, personnel_id)
```

- スコア・一致スキルは**保存しない**（都度計算。承認時のスナップショットも持たない。
  根拠の凍結は提案作成時の `proposals.match_snapshot` が担う）
- `proposals` に `matching_id`（NULL可）を追加し、承認済みマッチングから提案を作成した場合に紐づける
- 承認/見送りの操作は**メンバー詳細（要員詳細）のマッチングタブ**に置く。マッチング一覧は閲覧・絞り込み専用
- 提案は承認と同時に自動作成しない。「提案を作成」ボタンで作成し、**承認済み＆提案未作成**はバッジ表示・絞り込み可能にする
- スコアの表示単位は **0〜100点** に統一する
- 決着済み:
  - 3章のテーブル構成のすり合わせ → **`personnel` 拡張＋薄い `matchings`、スコアは都度計算**（2026-08-17決定。3章冒頭参照）
  - `attendance_submission_source` の必須入力条件 → **任意入力（NULL可）で確定**
  - Excelインポート時の希望単価の数値化 → **インポート中止（2026-08-16）により消滅**

### 決定済み

スキルシート系の物理データモデルを確定した。DDLは thyme の `docs/ddl/schema-ses.sql` を参照。

| 論点 | 決定 | 決定日 |
|------|------|--------|
| 年月項目（`yyyy-mm`） | `date` 型。日は01固定 | 08-05 |
| 作成日時・更新日時 | 親テーブルのみ保持（`skill_sheets` 等）。子テーブルは持たない | 08-05 |
| 担当工程 | `career_phases` テーブルで正規化（Boolean列案は不採用）。`career_id`+`phase_type` 複合PK | 08-05 |
| スキルシートのスキルマスタ | **持たない**。スキル名を直接保持 | 08-05 |
| 下書きの `content` | `json` 型（MySQL 5.7.44 で利用可） | 08-05 |
| 単価 | 数値（円/月）の上下限。`desired_unit_price_min` / `max`。API・画面は万円/月 | 08-05 |
| 論理削除 | **行わない**（物理削除）。`skill_sheets.status` は 0:未公開 / 1:公開済み | 08-05 |
| 社員番号 | 4桁（実データ2桁。拡張分を確保）。重複不可 | 08-05 |
| 外部キー制約 | 張らない（既存fukuroに準拠）。整合性はアプリ側で担保 | 08-05 |
| DDLの統合 | スキルシート系＋マッチング・提案系＋メール系を**17テーブルの統合版DDLに一本化**（実装ベース） | 08-09 |
| 勤怠提出元 | 職歴単位 → **`skill_sheets` のシート単位に変更**。NULL可 | 08-12 |
| 必須カラム | `skill_sheets` の `gender` / `birth_date` / `prefecture` / `city` を NOT NULL 化 | 08-12 |

DB製品はMySQL 5.7.44（thymeが接続する既存環境に合わせる）。

---

## 関連ドキュメント

- [MVP要件定義](../requirements/mvp-requirements.md)
- [Lavender組み込み要件](../requirements/lavender-integration.md)
- [スキルシート要件](../requirements/skill-sheet-requirements.md)
- [画面設計](screen-design.md)
