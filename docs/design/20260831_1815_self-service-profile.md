# P2: メンバー本人セルフサービス設計書（基本情報編集・PW変更・シート紐づけ根治）

*2026-08-31起草・レビュー待ち。背景は `docs/development/20260827_1810_release-checklist.md` の8/31実施記録と
メモリ ses-member-onboarding-p2 を参照。実装ブランチ: feature/skill-sheet（thyme / Lavender）。*

## 1. 背景と目的

本番リリース後の運用開始で、一般ロール（メンバー本人）ができる操作がスキルシート入力のみと判明した。
新規登録フロー（①管理者がユーザー作成 ②メンバー作成 ③本人入力）の「③本人入力」の範囲を
基本情報まで広げ、あわせて以下の実害バグを根治する。

- **BUG-1**: 一般ユーザーがメンバー詳細タブから新規スキルシートを作成すると、シート保存は成功するが
  自動紐づけ（`skillSheetEdit.tsx` linkToMember → `updatePersonnel`＝管理者専用API）が403で失敗し、
  紐づけUI撤去済みのため復旧手段がない
- **課題-2**: 本人パスワード変更機能がなく、初期PWをチャットで受領する運用になっている

## 2. スコープ

| # | 機能 | 対象 |
|---|------|------|
| 1 | 本人プロフィール取得・更新API + 画面 | thyme + Lavender |
| 2 | 本人シート紐づけAPI（BUG-1根治） | thyme + Lavender（linkToMember差し替え） |
| 3 | 本人パスワード変更API + 画面 | thyme + Lavender |

**非スコープ**: 招待メール・トークン式PW初期設定（P3）／生年月日・性別の必須タイミング変更
（決定#33は現状維持=管理者登録時必須。チャット収集運用でカバー。P3で再検討）

## 3. API設計（thyme）

すべて既存 `SesScopeGuard.self()`（AuthenticationProvider.getUserId() → personnel逆引き）を起点とし、
**本人に紐づくpersonnelのみ**を対象にする。紐づけの無いユーザーは全APIでエラー（state=機能エラー）。

### 3.1 GET /ses/me/profile
本人personnelの全項目を返す（既存 GET /ses/personnel/{id} のView流用。id指定は受けない）。
※既存 GET /ses/me（personnelIdのみ返す）は互換のためそのまま残す。
**マスク（2026-09-01改訂）**: freelancer・attendanceSubmissionSource・foreignNational・memo は本人向けにも
非返却（既存の一般ロール向けGET /ses/personnel/{id}のマスク方針を維持。foreignNationalは
2026-08-31時点は本人編集可としていたが、2026-09-01親判断で管理者専用に変更し非返却化。
memoは3.2の管理者専用項目としてPOSTでは以前から現値維持していたが、GETでも同様にマスクするよう明確化）。

### 3.2 POST /ses/me/profile
本人personnelの更新。**入力DTOは本人編集可の項目のみ**とし、管理系項目はサーバー側で現値を維持する
（全置換方式のPersonnelService.registを流用し、controller層で現値をマージしてから渡す）。

| 本人編集可 | 管理者専用（本人からは変更不可・現値維持・本人不可視） |
|---|---|
| name / nameKana / nameInitial / gender / birthDate / station（最寄駅）/ prefecture / city / education / preferredLocation / remotePreference / desiredUnitPriceMin・Max（希望単価。本人公開OK=2026-08-31人間判断） | personnelType / status / availableFrom / memo（管理者専用。本人不可視。GETでもマスク=2026-09-01明確化） / partnerCompany / employeeCode / manageUserId / skillSheetId / attendanceSubmissionSource / freelancer（運用上混入しないため管理者専用側へ=2026-08-31人間判断） / foreignNational（管理者専用。本人不可視・変更不可・現値維持=2026-09-01人間判断で本人編集可から変更） |

バリデーションは既存registと同一（gender/birthDate必須=決定#33維持）。
更新成功時は既存の局所再計算トリガ（要員スキル変更時と同様）を発火しない
（プロフィール項目はマッチングスコアに影響しないため。年齢条件を導入した場合は再検討）。

### 3.3 POST /ses/personnel/{id}/skill-sheet-link
シート紐づけ専用（BUG-1根治）。request: `{ skillSheetId }`。パスの{id}が紐づけ先personnel。

- **アクセス制御は既存 `SesScopeGuard.canAccessPersonnel(id)`**: 一般ロールは本人のみ・管理者は全員可
  （/ses/me固定にすると管理者がメンバーXのタブから新規作成した際に管理者自身へ紐づく誤りになるため、
  対象指定型とする。2026-08-31設計修正）
- 対象personnelの `skill_sheet_id` が **null の場合のみ**設定可（既に別シートへ紐づけ済みなら機能エラー=付け替え不可）
- 対象シートが他要員に紐づけ済みなら既存 `assertSkillSheetAssignable` と同じ判定でエラー
- タブ起点新規作成の紐づけはロール問わず本APIに一本化
- **冪等化（2026-09-01追記・親承認済み案B）**: 対象personnelが既に**同一skillSheetId**へ紐づけ済みの場合は
  例外を投げずno-opで成功扱いにする（bindSkillSheet・局所再計算は再実行しない）。シート作成API
  （SkillSheetController）による本人への自動紐づけと、フロントが直後に呼ぶ本APIへの明示紐づけが
  同一操作で重なるケースで、後発の呼び出しが400になり「紐付けに失敗しました」と誤トースト表示される
  事象への対策（実害なし・紐づけ自体は成立済みだった。PersonnelService.linkSkillSheet）。
  **別のシート**へ既に紐づけ済みの場合は従来どおり機能エラー（付け替え不可）

### 3.4 POST /ses/me/password
request: `{ currentPassword, newPassword }`。現PWをpasswordEncoder.matchesで照合→不一致は機能エラー。
**新PWポリシー: 最小6文字・最大12文字**（2026-08-31人間決定。現行の管理者登録は「12文字以内のみ・最小なし」
=決定#23だが、本APIは min6/max12 を適用。既存PWへの遡及なし・変更時のみ適用）。
管理者登録画面（manageUserEdit）のポリシーをmin6に揃えるかは別途（本設計では変更しない）。
成功時も認証トークンは維持（再ログイン不要）。

### 3.5 SecurityConfig
一般ロール開放の一元管理ブロック（SecurityConfig.java 130行付近）に以下を追記:
`/ses/me/profile`（GET/POST）, `/ses/personnel/*/skill-sheet-link`（POST）, `/ses/me/password`。
`/ses/**` = ADMIN の包括ルールより前に列挙すること（既存ブロックと同じ位置）。

## 4. 画面設計（Lavender）

1. **本人プロフィール編集**: 本人メンバーページ（member/{id}・本人一致時）の基本情報タブに
   「基本情報を編集」ボタンを表示 → 本人用編集フォーム（personnelEditの縮小版。3.2の本人編集可項目のみ。
   管理者が開く既存personnelEditはそのまま）
2. **linkToMember差し替え**: `skillSheetEdit.tsx` の linkToMember を `POST /ses/personnel/{id}/skill-sheet-link` 呼び出しに変更（旧表記/ses/me/…は誤記・2026-08-31訂正）
   （fetchPersonnelDetail→全項目送信のマージ処理は削除）。管理者経路も同API
3. **パスワード変更**: ヘッダーのアカウントメニューに「パスワード変更」を追加（現PW・新PW・確認の3欄）

## 5. テスト観点

- 権限: 一般ユーザーが他人のpersonnelId系APIに触れないこと（canAccessPersonnel既存テストの拡張）
- 3.2: 管理者専用項目を含むリクエストを送っても現値が維持されること（改ざん防止）
- 3.3: null時のみ成立・二重紐づけ拒否・他要員シート拒否／一般ロールでの新規作成→紐づけE2E（BUG-1再現→解消）
- 3.4: 現PW不一致・ポリシー違反・成功後の再ログイン不要
- 回帰: 管理者のpersonnelEdit全置換保存・タブ起点新規作成（管理者）

## 6. 実装段取り

1. thyme: DTO・Service（registマージ/紐づけ/PW変更）・Controller・SecurityConfig・ユニットテスト
2. Lavender: API層 → linkToMember差し替え → 本人編集フォーム → PW変更画面 → tsc/テスト
3. 手順書（OneDrive temp/20260831_スキルシート入力手順書.docx）の改訂: 「基本情報はこちらで登録済み」
   「新規作成ボタンは触らない」の2記述を本人操作の案内に差し替え

## 7. レビュー確定事項（2026-08-31 人間レビュー済み）

- 編集可否マトリクス: 希望単価は本人に公開・編集可。freelancerは管理者専用側へ
- PWポリシー: 本人PW変更は min6 / max12（既存PWへの遡及なし）
- 本人プロフィール更新の監査: 不要（update_datetimeのみで足りる）

**本設計は確定。実装可。**
