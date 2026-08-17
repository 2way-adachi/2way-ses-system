# Lavender組み込み要件

本システムは独立サービスとして構築せず、既存の管理画面 **Lavender（2way Manage system）の1機能**として追加する。

- 作成日: 2026-08-04
- 更新日: 2026-08-17（SESメニュー再整理を反映。同日、実装状況注記を追記）
- ステータス: ドラフト
- 前提変更: 当初は独立Webシステムを想定していたが、Lavenderへの機能追加に方針変更

> **実装状況**: 実装は本再整理より前の構成（大項目2つ・`/skill-sheet` `/ses/**` `/project` `/staff`）で
> 進んでおり、本章のメニュー・パス体系へは未追従。詳細は [実装現状の記録](../development/implementation-status.md) を参照。

---

## 1. 方針

| 項目 | 内容 |
|------|------|
| 追加先 | Lavender（管理画面 React／`2way_repository/Lavender`） |
| 位置づけ | Lavender内の**新しい大項目**として追加する |
| 理由 | 対象システムがFUKURO2.0ではなくSESであるため、既存の大項目とは分離する |
| 認証 | Lavender既存のログイン機構をそのまま利用する |
| 共通レイアウト | Lavender既存のAppBar・Drawer・Containerをそのまま利用する |

独立したフロントエンド基盤・ログイン・共通レイアウトは**新規に作らない**。

---

## 2. サイドバー構成

### 現状（Lavender）

サイドバーは `src/index.tsx` の「ログイン中のメニュー」に定義されている。
大項目の見出しは `Typography variant="overline"` で表現し、その下に `MenuList` / `MenuItem` を並べる構造。

```text
FUKURO2.0                ← 大項目（overline見出し）
  ユーザー情報
  アプリホーム
  景品情報
  店舗情報
  会社情報
  ガチャ開催期間情報
  発送依頼情報
  広告情報
  袋デザイン情報
  新規問い合わせ
  利用者問い合わせ
  アプリバージョン情報
  SNS設定情報
─────────────────────    ← Divider
  ログアウト
```

### 変更後

**FUKURO2.0とは別の大項目「SES」を新設**し、その配下にメニューを追加する。

```text
FUKURO2.0                ← 既存（変更しない）
  ユーザー情報
  ： （中略）
  SNS設定情報

SES                      ← 新設する大項目
  案件メール一覧
  要員メール一覧
  メンバー一覧
  マッチング一覧
  提案管理一覧
─────────────────────    ← Divider（既存）
  ログアウト
```

### 要件

- 大項目「SES」は、FUKURO2.0の`MenuList`の**後**、`Divider`＋ログアウトの**前**に配置する
- 大項目の見出しは既存と同じ表現（`Typography variant="overline"`）を用い、見た目を揃える
- 既存のFUKURO2.0配下のメニュー項目は**変更・削除しない**
- 大項目名は「SES」とする（表記ゆれを避けるため、画面上の文言はこの1箇所に統一）

---

## 3. 追加するメニューと画面

| メニュー | 画面 | 備考 |
|---------|------|------|
| 案件メール一覧 | 案件メール一覧／案件詳細・編集／メール取り込み | 案件メールから取得した案件を一覧表示する |
| 要員メール一覧 | 要員メール一覧／要員詳細・編集／メール取り込み | 要員メールから取得した要員を一覧表示する |
| メンバー一覧 | メンバー一覧／メンバー詳細 | メンバー詳細に info、スキルシート、提案、マッチングのタブを持つ |
| マッチング一覧 | マッチング一覧 | 押下時はメンバー詳細のマッチングタブを表示する |
| 提案管理一覧 | 提案管理一覧 | 押下時はメンバー詳細の提案タブを表示する |

スキルシートは独立メニューではなく、メンバー詳細の「スキルシート」タブに配置する。

---

## 4. ルーティング

Lavenderのルーティングは `src/index.tsx` の `<Switch>` に集約されている。
一覧を `/xxx`、詳細・編集を `/xxx/:id` とする既存パターンに合わせる。

### パス案

| 画面 | パス |
|------|--------|
| 案件メール一覧 | `/project-mail` |
| 案件メール取り込み | `/project-mail/import` |
| 案件詳細・編集 | `/project-mail/:id` |
| 要員メール一覧 | `/staff-mail` |
| 要員メール取り込み | `/staff-mail/import` |
| 要員詳細・編集 | `/staff-mail/:id` |
| メンバー一覧 | `/member` |
| メンバー詳細 | `/member/:id` |
| メンバー詳細 info タブ | `/member/:id?tab=info` |
| メンバー詳細 スキルシートタブ | `/member/:id?tab=skill-sheet` |
| メンバー詳細 提案タブ | `/member/:id?tab=proposal` |
| メンバー詳細 マッチングタブ | `/member/:id?tab=matching` |
| マッチング一覧 | `/matching` |
| 提案管理一覧 | `/proposal` |

> **ルートの記述順に注意**: `<Switch>` は先勝ちのため、
> `/project-mail/import`、`/staff-mail/import` は `:id` より**前**に定義する。
> 後ろに置くと `:id` に吸われて詳細画面に遷移してしまう。
>
> マッチング一覧および提案管理一覧の行押下時は、それぞれ `/member/:id?tab=matching`、
> `/member/:id?tab=proposal` に遷移し、メンバー詳細内で状況を確認する。

> **決定（2026-08-04）**: パスは**ケバブケースに統一する**。
> 既存Lavenderはケバブケース（`/contact-prospect`、`/app-version`、`/sns-setting`）と
> キャメルケース（`/bagDesign`、`/gachaPeriod`）が混在しているが、新規追加分は
> 比較的新しいケバブケースに揃える。既存パスの改名は行わない。

> **実装状況**: 実装済みのパスは `/skill-sheet`（一覧・new・:id・:id/edit）、`/project`、`/staff`、
> `/ses/personnel`、`/ses/projects`、`/ses/proposals` で、本表とは異なる。改修が必要。

---

## 5. ディレクトリ構成

Lavenderは `src/views/{機能名}/` 配下に `{機能名}List.tsx` / `{機能名}Edit.tsx` を置く構成。
この規約に合わせる。

```text
src/views/
  projectMail/
    projectMailList.tsx
    projectMailDetail.tsx
    projectMailImport.tsx
  staffMail/
    staffMailList.tsx
    staffMailDetail.tsx
    staffMailImport.tsx
  member/
    memberList.tsx
    memberDetail.tsx
    memberInfo.tsx
    memberSkillSheet.tsx
    memberProposal.tsx
    memberMatching.tsx
  matching/
    matchingList.tsx
  proposal/
    proposalList.tsx
```

API呼び出しは既存同様 `src/api/components/` にフックとして追加する。

---

## 6. 技術スタック（確定分）

Lavenderへの組み込みにより、フロントエンドの技術スタックは既存に従うことで確定した。

| 項目 | 内容 |
|------|------|
| React | 17.0.2 |
| TypeScript | 4.1.6 |
| UIライブラリ | Material-UI 4.12.2 |
| ルーティング | react-router-dom 5.2.0 |
| 状態管理 | Redux Toolkit 1.6.1 / react-redux 7.2.4 |
| HTTPクライアント | axios 0.21.1 |

新しいUIライブラリ・状態管理ライブラリは**導入しない**。

> 画面モックはMaterial Design系の管理画面として作成しているが、実装時はMaterial-UI v4の
> コンポーネントに置き換える。モックのHTML/CSSをそのまま移植しない。

---

## 7. 影響範囲

### 変更するファイル

| ファイル | 変更内容 |
|---------|---------|
| `src/index.tsx` | SES大項目とメニュー項目の追加、ルート定義の追加、import追加 |

### 追加するファイル

- `src/views/projectMail/` 配下の画面
- `src/views/staffMail/` 配下の画面
- `src/views/member/` 配下の画面
- `src/views/matching/` 配下の画面
- `src/views/proposal/` 配下の画面
- `src/api/components/` 配下のAPI呼び出しフック

### 変更しないもの

- FUKURO2.0配下の既存メニュー・画面・ルート
- `src/frame.tsx`（レイアウト。SES追加のために変更する必要はない想定）
- 既存の認証・トークン管理（`loginSlice` / IndexedDB）

> **実装状況**: 実装では `src/frame.tsx`（スキルシート印刷用クラス）とログイン状態
> （ロール追加の仮実装。9章の実装状況参照）にも変更が入っており、本節の想定と異なる。

---

## 8. 未確定事項

### 決定済み（2026-08-04）

| 論点 | 決定 |
|------|------|
| **バックエンドAPIの配置** | 既存の **thyme**（Spring Boot）に相乗りする |
| **DBの配置** | fukuroに同居させず、**SES用のスキーマを新設する**（テーブル名の`ses_`プレフィックスは不要） |
| **スキーマをまたぐ管理ユーザー参照** | **API層で解決する**。スキーマをまたぐJOIN・外部キーは張らない |
| **SESメニューの表示制御** | **常時表示する**。権限による出し分けは行わない |
| **メンバー詳細タブの初期表示** | マッチング一覧、提案管理一覧からの遷移元に応じて表示タブを指定する |
| **リポジトリの役割** | `2way-ses-system` は要件文書と画面モックのみ。実装はLavender／thymeへの改修 |
| **パス命名規約** | **ケバブケースに統一**する（既存パスの改名は行わない） |

SESメニューを常時表示とする理由は、Lavenderを利用するのが管理者と社員に限られ、
SES機能自体を見せてはいけない利用者が想定されないため。

スキルシートはメンバー詳細内のタブとして扱うため、独立メニューとしての初期表示出し分けは行わない。

### 確定済み（追加分）

| 論点 | 決定 | 決定日 |
|------|------|--------|
| PDF出力の実装方式 | 印刷用HTML＋`window.print`（[スキルシート要件 9章](skill-sheet-requirements.md)）。実装済み | 08-05 |
| Excelアップロード | **Excelインポートごと中止** | 08-16 |

---

## 9. メンバー詳細タブの表示制御

メンバー詳細は、info、スキルシート、提案、マッチングのタブを持つ。

マッチング一覧から遷移した場合はマッチングタブ、提案管理一覧から遷移した場合は提案タブを初期表示する。

> **実装状況と方針（2026-08-17 決定）**: 実装に残る `POST /skill-sheet/entry` API（バックエンドのスタブ・
> フロント未接続）は**撤去する**。ログインAPIレスポンスへのロール追加（仮実装）は、一覧の勤怠提出元列・
> 検索の表示制御に使用中のため**当面維持**し、本認証のロール定義確定時に差し替える
> （[実装現状の記録 5章](../development/implementation-status.md)）。

### 一般ユーザー（メンバー）の利用範囲

権限による出し分けの意図は廃止ではなく、タブ集約後の構成へ実装箇所が移る。

- 一般ログイン（メンバー）の主目的は**自分のスキルシートの編集**とする
- タブ集約後は、一般ユーザーを自分のメンバー詳細（スキルシートタブ）へ誘導する導線として実装する
- 一般ユーザーにも**案件一覧の参照を許可する**（2026-08-17決定）。
  ただし許可範囲（ロール×機能）は**一元管理**し、後から容易に切り替えられる実装とする
  （フロントのメニュー出し分けと、API側の許可リストを、それぞれ1か所に集約して定義する）
- 管理者以外に他人の情報を返さない担保はAPI側で行う（方針不変）

### 実装上の注意

- Lavenderの既存ログイン機構・ログインAPIのレスポンスは**変更しない**
- メンバー詳細の参照、スキルシート更新、提案更新、マッチング更新APIでは、API側で必要な権限判定を行うこと
- 画面側のタブ切り替えだけで参照範囲を制御せず、API側でも他人の情報を返さないことを担保する

> 権限体系の詳細な調査結果・設計方針は社内メモで別途管理している。
> 本リポジトリは公開設定のため、認証・認可の内部仕様はここには記載しない。

---

## 関連ドキュメント

- [MVP要件定義](mvp-requirements.md)
- [スキルシート要件](skill-sheet-requirements.md)
- [画面設計](../design/screen-design.md)
- [データモデル](../design/data-model.md)
- [開発体制と役割分担](../development/team-responsibilities.md)
- [実装現状の記録](../development/implementation-status.md)
