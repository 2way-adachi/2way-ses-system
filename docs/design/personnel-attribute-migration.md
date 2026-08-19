# スキルシート個人属性のメンバー移設 設計

作成: 2026-08-19 / ステータス: **設計確定・実装未着手**
関連: [データモデル](data-model.md)、[画面設計 6〜7章](screen-design.md)、[タスクリスト C7](../development/20260818_1758_fix-tasks.md)、[決定#32・#33](../development/decision-log.md)

---

## 1. 目的と背景

タスクリスト [C7](../development/20260818_1758_fix-tasks.md)「スキルシート編集の基本情報タブは削除する」を検討した結果、
タブをそのまま削除すると基本情報タブにしかない8項目が編集・閲覧できなくなり、単純削除できないことが判明した。

人間の判断（2026-08-19）:

> 基本情報タブの項目は属性としてメンバー寄りなので、メンバー側で持たせる。重複しているものは単純削除でよい。

これを受け、基本情報タブの13項目を「メンバー（`personnel`）へ移設する8項目」と「メンバーに同等カラムがあるため単純削除する5項目」に仕分け、
移設後のデータモデル・画面・影響範囲を本書で確定する。**本書は設計のみで実装は別タスク**。

## 2. 現状のデータ配置と何が問題か

スキルシート編集画面（Lavender `src/views/skillSheet/skillSheetEdit.tsx`）は基本情報／スキル・資格／経歴／自己PRの4タブ構成で、
基本情報タブ（`skillSheetEdit.tsx:978-1213`）に13項目を持つ。これらは氏名・生年月日・居住地・学歴・希望条件など、
本来は「人（メンバー）」に属する情報だが、現状は `skill_sheets` テーブル（`schema-ses.sql:96-118`）にしか存在しない。

一方 `personnel` テーブル（`schema-ses.sql:338-361`）は2026-08-17の拡張（決定#8・#12。[data-model.md 3章](data-model.md)）で
`name` / `gender` / `birth_date` / `nearest_station` / `desired_unit_price_min` / `desired_unit_price_max` を既に持っており、
メンバー自身の属性を保持する器としてはすでに機能している。この状態で以下3点の不整合が起きている。

1. **メンバー一覧の検索が、実体のないメンバー属性を検索しているように見える。**
   `personnelEdit.tsx:695` の絞り込みラベルは既に「氏名・社員番号で絞り込み」だが、社員番号（`employeeCode`）は
   `personnel` に存在せず `skill_sheets.employee_code` にしかない。ラベル上は要員の識別子として扱われているのに、
   実体はスキルシート側にある。
2. **マッチング判定が、メンバー本人の属性であるはずの値を「紐付くスキルシートの値」として外部から受け取っている。**
   thyme `entity/MatchSubjectData.java` の `of(Personnel personnel, Integer remotePreference)`（66-79行目）は、
   リモート希望（`remotePreference`）を引数で外から渡す形になっている（Javadoc 63行目「紐付くスキルシートのremote_preference。無ければnull」）。
   この値はマッチング判定の `workStyle` 軸（`internal/MatchScoreCalculator.java:392` の `workStyle(Integer remoteType, Integer remotePreference)`）で
   実際に使われる。メンバー自身の属性のはずのリモート希望が、メンバーのフィールドとして直接持てていない。
3. **スキルシート未作成のメンバーは、この8属性を一切持てない。**
   開発DBの実データでも「検証」要員7名を含む要員11名中1名（2026-08-19時点）はスキルシート未作成であり、
   その間フリガナも居住地も最終学歴も入力できない。属性としての実在はメンバー側にあるべきという判断の裏付けになっている。

## 3. 移設対象8項目

`skill_sheets`（`schema-ses.sql:96-118`）にのみ存在し、`personnel` へ移設する項目。型・制約は現行DDLのまま踏襲する
（この8項目の NOT NULL/NULL可 区分に変更はない。§4の5項目のうち性別・生年月日の制約変更は§7決定4を参照）。

| 項目 | `skill_sheets` のカラム | 型・制約（現行） | 備考 |
|---|---|---|---|
| 社員番号 | `employee_code` | `varchar(4) NOT NULL`・**UNIQUE**(`SKILL_SHEETS_EMPLOYEE_CODE`) | クライアント側検証: `skillSheetEdit.tsx` の `validateEmployeeCode()`（287-295行目） |
| フリガナ | `name_kana` | `varchar(32) NOT NULL` | 「姓 名」形式・全角カタカナ検証: `validateNameKana()`（362-373行目） |
| 都道府県 | `prefecture` | `varchar(16) NOT NULL` | |
| 市区町村 | `city` | `varchar(64) NOT NULL` | |
| 最終学歴 | `education` | `varchar(256) NULL` | |
| 希望勤務地 | `preferred_location` | `varchar(256) NULL` | |
| リモート希望 | `remote_preference` | `int NULL`（0:出社のみ可/1〜3:週1〜3/4:フルリモート） | マッチング`workStyle`軸で使用（`MatchScoreCalculator.java:392`） |
| 勤怠提出元 | `attendance_submission_source` | `int NULL`（0:上位会社/1:参画中メンバー） | **管理者のみ参照・編集**（`skillSheetEdit.tsx:1112` の `isAdmin &&` ガード。本人には非表示） |

## 4. 単純削除する重複5項目

`personnel`（`schema-ses.sql:338-361`）に同等カラムが既にあるため、スキルシート編集画面から**そのまま削除してよい**項目。
`personnel` 側に列を追加する必要はない。

| 項目 | `skill_sheets` のカラム | `personnel` の対応カラム | 差異 |
|---|---|---|---|
| 氏名 | `name`（`varchar(32) NOT NULL`） | `name`（`varchar(32) NOT NULL`） | なし |
| 性別 | `gender`（`int NOT NULL`） | `gender`（`int NULL`） | **NULL可否が異なる**（§7決定4で`NOT NULL`に統一） |
| 生年月日 | `birth_date`（`date NOT NULL`） | `birth_date`（`date NULL`） | **NULL可否が異なる**（§7決定4で`NOT NULL`に統一） |
| 最寄駅 | `nearest_station`（`varchar(64) NULL`） | `nearest_station`（`varchar(64) NULL`） | なし |
| 希望単価（下限・上限） | `desired_unit_price_min`/`max`（`int NULL`） | `desired_unit_price_min`/`max`（`int NULL`） | なし |

## 5. 移設後のデータモデル

**前提: メンバーが主、スキルシートは付随物**（人間判断、2026-08-19）。

> スキルシートだけのデータは不要になるかな。考え方として、メンバーがいて、そこに付随するスキルシートを付け足すって感じ

この考え方が本設計全体の前提であり、スキルシートは必ずメンバー起点でのみ作成される（§7 決定2）。
すでに実施済みのUI変更（要員詳細・スキルシート単独一覧画面の廃止、編集ルートの `/member/:memberId/skill-sheet/...` への移設。
[decision-log.md #8（2026-08-17）](../development/decision-log.md)）は、この考え方の先行実装にあたる。

責務を「メンバー＝人の属性」「スキルシート＝職務経歴書」で分ける。

- **`personnel`**: 本人に紐づく属性全般（氏名・連絡先寄りの情報・希望条件・マッチング判定材料）を持つ器。
  移設後は氏名・フリガナ・性別・生年月日・住所（都道府県・市区町村）・最寄駅・最終学歴・希望単価・希望勤務地・
  リモート希望・勤怠提出元・社員番号を持つ。スキルシートの有無に関わらず必ず参照できる。
- **`skill_sheets`**: 職務経歴書としての内容（スキル・資格・経歴・自己PR）に専念する。`self_pr` は経歴書の一部として残す。

移設後、スキルシート編集画面は基本情報タブが消えて**3タブ（スキル・資格／経歴／自己PR）**になる。

**決定事項: 印刷帳票・スキルシート詳細表示のAPI設計**（人間判断、2026-08-19）。`skillSheetPrint.tsx`・`skillSheetDetailContent.tsx` は
**(b) フロントで `personnel` と `skill_sheets` の2 API を呼び、画面側で結合する**方式を採用する。スキルシート取得APIのレスポンスに
`personnel` 側の項目を合成する案（(a)）は採らない。実装箇所の詳細は[6.3](#63-lavender)、決定理由は§7決定1を参照。

## 6. 影響範囲

### 6.1 DB

- `personnel` に8カラム追加（§3の型・制約に準拠）
- `personnel.gender`・`personnel.birth_date` を現行の `NULL可`（`schema-ses.sql:345-346`）から**`NOT NULL`** へ変更
  （§7決定4）。適用前に既存データの補完が必須（順序込みの手順は§8参照）
- `skill_sheets` から8カラム削除
- UNIQUE制約の移設: `SKILL_SHEETS_EMPLOYEE_CODE` を `personnel` 側へ（`PERSONNEL_EMPLOYEE_CODE_UNIQ` 等）
- 既存データの移行: `personnel.skill_sheet_id` で紐づく行から8項目をコピー。未紐付けのスキルシートがあれば併せて確認する
- `docs/ddl/schema-ses.sql` を更新（本書はDDLを変更しない。読むのみ）

### 6.2 thyme

- `docs/ddl/schema-ses.sql`: 上記DDL変更を反映
- entity/mapper: `Personnel` / `SkillSheets`（および `*Example`）を MyBatis generator で再生成
- `PersonnelService`（`service/PersonnelService.java`）: 8項目の登録・更新・重複チェック（`SkillSheetService.assertEmployeeCodeNotDuplicate()`
  相当。現行は `SkillSheetService.java:237` で `ServiceException(1)` を投げている）を実装。**重複チェックの責務がスキルシート保存APIから
  メンバー登録・編集APIへ移る**（§7決定3）。エラーコード・target文字列の契約が変わる点はフロント側（6.3）と合わせて対応する
- `SkillSheetService`（`service/SkillSheetService.java`）: 基本情報系のバリデーション・重複チェックを撤去
- `PersonnelRegistArgData`（`entity/PersonnelRegistArgData.java`）: `gender`（47行目）・`birthDate`（51行目）に `@NotNull` を追加
  （§7決定4。現行はアノテーションなしで任意入力）
- `MatchSubjectData`（`entity/MatchSubjectData.java`）: `of(Personnel personnel, Integer remotePreference)`（66-79行目）の
  `remotePreference` 引数渡しが不要になり、`personnel.getRemotePreference()` を直接読む形に変わる。Javadoc（12-18行目）の
  「紐付くスキルシートのremote_preference」という前提も書き換えが必要
- `SkillSheetDetailShowData` / `SkillSheetListShowData` / `SkillSheetEditArgData`: 8項目のフィールド・バリデーションアノテーションを削除
- 各テスト: `PersonnelService` 系・`SkillSheetService` 系のユニットテスト、`SesValidationTest`（決定#29関連）の該当ケース

### 6.3 Lavender

- `personnelEdit.tsx`: 8項目の入力欄を追加（ローディングガード・バリデーションパターンは既存の `skillSheetEdit.tsx` の
  `validateEmployeeCode`・`validateNameKana` 等を移植）
- `personnelEdit.tsx`: 既存の `gender`（95・388行目）・`birthDate`（96・405行目）入力を**必須化**（§7決定4）。
  現行は未入力を `null` 送信で許容している（297-298行目 `gender: gender || null` 等）ため、この許容を外し必須バリデーションを追加する
- `personnelEdit.tsx`: 社員番号の重複エラー振り分けを `skillSheetEdit.tsx:722`
  （`errors.find((e) => e.code === 201 && e.target === 'request.employeeCode')`）から移設する（§7決定3）
- `personnelDetail.tsx`: infoタブ（[screen-design.md 6.1](screen-design.md)）の表示項目candidateに8項目を追加。
  スキルシートタブ側の `SkillSheetDetailContent` 表示（339-370行目付近、`skillSheet.employeeCode` 表示を含む `:352`）は
  取得元を `skillSheet` から `personnel` へ変更
- `skillSheetEdit.tsx`: 基本情報タブ（978-1213行目）を削除し3タブ化。`EMPTY_SHEET`・`ISkillSheetResponse` 型・
  `normalizeSkillSheet`・`collectValidationErrors`（394-461行目）から8項目分を除去
- `skillSheetPrint.tsx`・`skillSheetDetailContent.tsx`: **(b) 2 API合成方式を採用**（§5決定事項・§7決定1）。
  各コンポーネント自身では `personnel` を取得せず、呼び出し元の `personnelDetail.tsx`（スキルシートタブ）が
  `personnel` と `skill_sheets` の両方を取得し、`nameKana`・`prefecture`/`city`・`education`・`preferredLocation` 等の
  personnel側項目を props として渡す形に変更する。`skillSheetPrint.tsx`（`nameKana`:268行目・`prefecture`/`city`:339-340行目・
  `education`:349行目）、`skillSheetDetailContent.tsx`（`nameKana`:146行目・`prefecture`/`city`:150行目・`education`:154行目・
  `preferredLocation`:167行目）はいずれも参照元を `skillSheet` から props 経由の `personnel` 値へ切り替える

## 7. 決定事項

以下4点は当初「未決事項（要判断）」としていたが、2026-08-19に人間判断が出て確定した。

1. **印刷帳票・スキルシート詳細表示のAPI設計**。
   **決定**: (b) フロントで `personnel` と `skill_sheets` の2 APIを呼び、画面側で結合する方式を採用する。
   スキルシート取得APIのレスポンスに `personnel` 側の項目を合成する案（(a)）は採らない。
   **決定理由**: (a)は既存の「スキーマをまたぐJOINはAPI層で解決する」方針（[data-model.md 0章](data-model.md)）とは整合するものの、
   スキルシート単体APIの責務が広がってしまう。(b)を採ることでAPIの責務を素直に保ち、結合はフロント側（呼び出し元の
   `personnelDetail.tsx`）に閉じ込める。詳細は[6.3](#63-lavender)。
2. **スキルシートとメンバーの紐付け必須化**。
   **決定**: 必須化する。スキルシートは必ずメンバー起点でのみ作成され、メンバーに紐付かないスキルシート単体は作らせない
   （APIレベルで強制する）。
   **決定理由**: 「メンバーがいて、そこに付随するスキルシートを付け足す」という考え方（§5前提）を採用したため。
   移設後は氏名・生年月日等の基本属性がすべて `personnel` 側にしかなくなり、メンバーに紐付かないスキルシートは
   実質意味をなさない。既に実施済みのUI変更（要員詳細・スキルシート単独一覧画面の廃止、編集ルートの
   `/member/:memberId/skill-sheet/...` への移設）はこの考え方の先行実装にあたる。
3. **社員番号UNIQUE制約の移設に伴うエラー発生箇所の変更**。
   **決定**: 要判断事項から外す。設計上の分岐ではなく、メンバー移設に伴い自動的に決まる実装作業である。
   現行はスキルシート保存時に `SkillSheetService.assertEmployeeCodeNotDuplicate()`（`SkillSheetService.java:237`）が
   `ServiceException(1)` を投げ、フロントは `skillSheetEdit.tsx:722` で `code === 201 && target === 'request.employeeCode'`
   を見て専用のエラー表示をしている。移設後はこの重複チェックがメンバー登録・編集APIの責務になり、エラーコード・target文字列の
   契約が変わる。フロント側のエラー振り分けロジックも `personnelEdit.tsx` へ移す。作業項目は[6.2](#62-thyme)・[6.3](#63-lavender)参照。
4. **性別・生年月日の必須/任意の統一**。
   **決定**: 全メンバー必須とする。`personnel.gender`・`personnel.birth_date` を `NOT NULL` 化し、画面・APIでも必須にする。
   **決定理由**: スキルシート編集フローで必須入力を課していた実利用上の意図（社外提出用の職務経歴書に生年月日・性別が必要）を、
   メンバー編集フロー側の必須化で引き継ぐ。「メンバーが主」という前提（§5）とも整合する。

### 補完方法（当初は運用判断としていたが解決済み）

決定4に伴う既存データ補完について、当初は「補完値を人間が入力するのか暫定値を置くのか」を運用判断として残していたが、
実データを確認した結果**暫定値は不要**と判明し、判断は解消した。

- `personnel` 11件のうち10件はスキルシートに紐付いており、`skill_sheets.gender`・`birth_date` は `NOT NULL` なので
  **必ず実値を持っている**。`personnel` 側がNULLなだけなので、スキルシートからコピーすれば埋まる
- コピー元が無いのはスキルシート未作成の1件のみで、これは人間が実値を指定した
- したがって補完は「スキルシートからの実値コピー＋コピー元が無い1件の人間指定値」で完結する。暫定値は使わない

## 8. 移行手順の案

DDL変更・データ移行・thyme・Lavenderの順に、各段階で動作を壊さずに進める。
**手順2（既存データ補完）を飛ばして手順3（NOT NULL化DDL）を実行すると失敗する**ため、この2手順は必ずこの順序で実施する。

> **進捗（2026-08-19）**: 手順1〜4は開発環境へ**適用済み**。手順5（thyme）に着手した段階。
> 適用に使ったSQLはリポジトリ外で管理している。`ALTER TABLE` はMySQLの仕様でロールバックできないため、
> 適用前に `personnel` の全行をJSONへ退避してから、手順ごとに区切って実行した。

1. **DDL（1回目）**: `personnel` に8カラムを追加（`NULL可`で追加。既存カラムには触れず、`gender`・`birth_date` の制約もこの時点では変更しない）。
   `skill_sheets` 側もこの時点では変更しない
2. **既存データ補完**（§7決定4に伴う対応）: `personnel.gender`・`personnel.birth_date` のNULLを埋める。
   紐付くスキルシートから実値をコピーし（`skill_sheets` 側は `NOT NULL` なので必ず値がある）、
   コピー元が無い行だけ人間指定値を入れる。**暫定値は使わない**（§7「補完方法」参照）。
   既存値を上書きしないよう、いずれのUPDATEもNULLガードを付ける
3. **DDL（2回目）**: 手順2の補完完了を確認したうえで、`personnel.gender`・`personnel.birth_date` を `NOT NULL` 化する
4. **データ移行**: `personnel.skill_sheet_id` で紐づく行を対象に、`skill_sheets` の8項目を `personnel` へコピーするワンショットSQL
   （投入前にトランザクション内ドライラン＋ROLLBACK確認。[E3の手順](../development/20260818_1758_fix-tasks.md)を踏襲）。
   このスクリプトは秘密情報を含まないため設計上は本リポジトリでよいが、接続情報を含む実行用SQLは既存運用どおりリポジトリ外管理とする
5. **thyme（読み取り経路を先に）**: `PersonnelService` に8項目の返却・更新機能を追加し、`MatchSubjectData.of(Personnel, ...)` を
   `personnel` 直読みへ切り替える。`PersonnelRegistArgData` の `gender`・`birthDate` に `@NotNull` を追加する。
   この段階では `skill_sheets` 側のカラムはまだ残っており、スキルシート編集は旧動作のまま動く
6. **Lavender**: `personnelEdit.tsx`・`personnelDetail.tsx` に8項目を追加し、`gender`・`birthDate` の入力を必須化する。
   `skillSheetPrint.tsx`・`skillSheetDetailContent.tsx` は取得元を切り替え、呼び出し元の `personnelDetail.tsx` が
   `personnel`・`skill_sheets` の2 APIを取得して渡す形にする（§7決定1）。社員番号の重複エラー振り分けも
   `personnelEdit.tsx` へ移す（§7決定3）。動作確認後に `skillSheetEdit.tsx` の基本情報タブを削除して3タブ化する
7. **thyme・DB（後片付け）**: `SkillSheetService` の基本情報系バリデーション・重複チェックを撤去し、
   `skill_sheets` から8カラムを削除、`SKILL_SHEETS_EMPLOYEE_CODE` のUNIQUE制約を撤去する
8. 各段階で該当モジュールのテスト（thyme: `mvnw.cmd test`、Lavender: `tsc --noEmit` + `npm test`）を実行し、
   壊れたまま次の段階へ進まない

---

## 関連ドキュメント

- [データモデル](data-model.md)
- [画面設計](screen-design.md)
- [Phase 1 API契約](phase1-api-contract.md)
- [修正タスクリスト C7](../development/20260818_1758_fix-tasks.md)
- [意思決定ログ #32](../development/decision-log.md)
