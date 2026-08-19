# Phase 1 API契約（マッチング・提案管理）

作成: 2026-08-07 / 対象: matching-design.md の Phase 1（LLMなし・ランニングコストゼロ）
フロント（Lavender）とバック（thyme）はこの契約を正とする。変更時は本ファイルを先に更新。

## パス・共通

- ベースパス: `/ses`（thyme既存のコントローラ規約に合わせて調整可。変えたら本ファイル更新）
- 日時はJST、`yyyy-MM-dd` / `yyyy-MM-dd HH:mm:ss`
- ページング: `?page=&size=`（既存thyme規約があればそちらに従う）

## 要員 personnel

```
GET  /ses/personnel?type=&q=&status=     一覧（type: employee|bp）
GET  /ses/personnel/{id}                 詳細（skills[] を含む）
POST /ses/personnel                      登録
PUT  /ses/personnel/{id}                 更新
```

```json
{ "id": 1, "personnelType": "employee", "name": "山田太郎",
  "status": "available", "availableFrom": "2026-09-01",
  "station": "川口", "memo": "",
  "skills": [ { "skillId": 10, "skillName": "Java", "years": 5 } ] }
```

- status: `available` / `assigned` / `unavailable`
- BPの場合 `partnerCompany` (string) を追加で持つ
- **一覧レスポンスにも `skills[]` を必ず含める**（2026-08-10 確定。フロントは `skills.slice` を
  前提にしており、省略するとクラッシュする。projects一覧も同様）。フロント側も防御的に
  `skills ?? []` で扱うこと（二重防御）

## 案件 projects

```
GET /ses/projects?q=&status=             一覧
GET /ses/projects/{id}                   詳細
```

フィールドはluna抽出スキーマ準拠: `title, requiredSkillsText, preferredSkillsText,
priceText, unitPriceMin, unitPriceMax, location, remoteType, startYm, startText,
interviewCount, description, nationalityAllowed, ageLimit, commercialFlow` + `status`(open/closed) +
`skills[]`（マスタ紐付け済みタグ）

- `location` は表示・営業判断用。初期版では自動判定対象にしない
- `nationalityAllowed` は外国籍可否の条件判定に利用する
- `ageLimit` は案件側の年齢条件として、要員年齢（`birthDate` から算出）との条件判定に利用する
- `commercialFlow` は社員のみ/BP可などの条件判定に利用する

## マッチング（①ハードフィルタ＋②タグ粗マッチ）

```
GET /ses/projects/{id}/candidates        案件→候補要員（上位20）
GET /ses/personnel/{id}/matches          要員→適合案件（上位20）
```

```json
{ "candidates": [ {
    "personnel": { "id": 1, "name": "...", "personnelType": "employee",
                   "nearestStation": "品川", "preferredLocation": "東京23区" },
    "score": 0.58,
    "skillScore": 0.72,
    "conditionFactor": 0.80,
    "matchedSkills": [ { "name": "Java", "years": 5 }, { "name": "Spring Boot", "years": null } ],
    "missingSkills": ["AWS"],
    "conditionChecks": {
      "price": { "status": "OK", "reason": "案件上限80万円 / 要員希望75万円" },
      "workStyle": { "status": "WARNING", "reason": "案件は週2出社 / 要員は週1出社まで希望" },
      "startDate": { "status": "OK", "reason": "案件開始9/1 / 要員参画可能9/1" },
      "nationality": { "status": "OK", "reason": "案件は外国籍可" },
      "age": { "status": "WARNING", "reason": "案件40歳まで / 要員42歳" },
      "commercialFlow": { "status": "OK", "reason": "案件はBP可 / 要員はBP" },
      "freelancer": { "status": "OK", "reason": "判定材料なし（案件側の記載なし）" }
    },
    "reason": null } ] }
```

- スキル評価: 必須スキル一致率を80%、尚可スキル一致率を20%として `skillScore` を算出する
  - 必須スキル一致率 = 一致した必須スキル数 / 必須スキル総数
  - 尚可スキル一致率 = 一致した尚可スキル数 / 尚可スキル総数
  - `skillScore = 必須スキル一致率 * 0.8 + 尚可スキル一致率 * 0.2`
  - 片側の総数が0件の場合はもう片方の一致率をそのまま `skillScore` とする
    （尚可0件なら必須一致率×1.0、必須0件なら尚可一致率×1.0。両方0件は0）
- 条件適合は `conditionChecks` に項目別の判定と理由を保持する（8軸。2026-08-18 決定#25・#26）
  - `price` / `workStyle` / `startDate` / `age` / `commercialFlow`: `OK` / `WARNING` / `NG`
  - `nationality` / `freelancer`（個人事業主）: `OK` / `NG`
  - `skillYears`（経験年数）: `OK` / `WARNING`（**NGなし**。2026-08-18 決定#26）
  - `location` は初期版では自動判定せず、案件側の場所と要員側の希望エリアを画面表示して営業担当が判断する
- 各軸の境界（2026-08-18 決定#25。判定に必要な値が片方でもnullの軸は **OK＋理由「判定材料なし」**）
  - `price`: レンジが重なればOK。重ならない場合、乖離が**5万円以内**ならWARNING、超えたらNG
    （要員希望が案件レンジより安い方向は常にOK）。
    4値が揃わなくても**判定に使う対の値が揃えば部分判定する**（2026-08-18 実機検証反映）:
    要員希望min × 案件上限max で「高すぎる」方向、要員希望max × 案件下限min で「安い」方向を判定。
    対が1つも揃わない場合のみOK＋「判定材料なし」（メール由来案件は上限のみ記載が多数派のため、
    4値必須にするとprice軸が実運用でほぼ機能しない）
  - `startDate`: 要員の稼働可能時期 ≦ 案件開始でOK。遅れ**1ヶ月以内**はWARNING、超えたらNG
    （要員が早く空く方向は常にOK）
  - `age`: 案件上限以下でOK。超過**5歳以内**はWARNING、超えたらNG
  - `workStyle`（案件 `remoteType` × 要員 `remotePreference`）:
    - 案件フルリモート → 常にOK
    - 案件常駐 × 要員フルリモート希望 → NG／要員週1〜3希望 → WARNING／出社のみ可 → OK
    - 案件併用 × 要員フルリモート希望 → WARNING（出社日数が案件側で不明のため）／それ以外 → OK
    - 案件不明 → OK
  - `commercialFlow`: NGは own_only × BP のみ。own_plus_support（条件付き可）× BP は
    **WARNING＋理由「条件付き可（要営業確認）」**（2026-08-18 上流同意済みでOK/NG二値から変更）。それ以外はOK
  - `nationality`: 案件が外国籍不可 × 要員が外国籍 → NG。それ以外はOK
  - `freelancer`: 案件が個人事業主不可 × 要員が個人事業主 → NG。それ以外はOK
  - 要求年数のバックフィル: `POST /ses/mail-import/skill-years-backfill`（管理者のみ・同期実行）。
    ボディ `{"all": true}` で全案件、未指定なら required_years が全てNULLの案件のみを対象に、
    元メール本文から年数のみを軽量再抽出して既存タグ行の required_years を更新する
    （行の追加・削除なし。手動登録案件=元メールなしは対象外）
  - `skillYears`: 一致スキルのうち、案件側に要求年数（`project_skills.required_years`。取込時にLLM抽出=prompt v4）が
    あり、要員の経験年数が不足するものが1つでもあれば **WARNING**（軸として1件。複数スキル不足でもWARNINGは1つ）。
    理由に不足スキルを列挙（例「Java: 要求5年 / 要員3年」）。要員側の年数未登録・案件側の要求年数なしは判定対象外
    （すべて対象外ならOK＋「判定材料なし」）。**NGにはしない**（「目安」「〜程度」表現が多く、
    ハード足切りは実態より厳しくなるため。精度検証は skill-years-extraction-verification.md）
- 条件適合に `NG` が1件でも含まれる場合はマッチング対象外とし、候補一覧には返さない
- `NG` がない場合、`WARNING` 件数に応じて `conditionFactor` を決め、総合点 `score` を算出する
  - `WARNING` 0件: `conditionFactor = 1.00`
  - `WARNING` 1件: `conditionFactor = 0.90`
  - `WARNING` 2件: `conditionFactor = 0.80`
  - `WARNING` 3件以上: `conditionFactor = 0.70`
  - `score = skillScore * conditionFactor`
- `matchedSkills` は決定#22-Aにより `{name, years|null}` 構造（要員の経験年数を併記。missingSkillsは名前配列のまま）
- 場所の参考表示用に、候補側refは要員の `nearestStation`・`preferredLocation` を、適合案件側refは案件の
  `location` を含める（自動判定はしない。営業判断材料としての並記用）
- `reason` は **Phase 2（LLM）用の席**。Phase 1では常にnull。フロントはnull時に非表示
- レスポンス形状（2026-08-07 確定）: `/projects/{id}/candidates` は `{ "candidates": [...] }`、
  `/personnel/{id}/matches` は `{ "matches": [...] }`（中身の行構造は同一）

## 提案 proposals

```
GET   /ses/proposals?projectId=&personnelId=&status=&includeDone=   ※レスポンスは配列直返し（2026-08-07 確定）
POST  /ses/proposals                     { projectId, personnelId, proposalText? }
PATCH /ses/proposals/{id}                { status?, proposalText?, interviewAt?, interviewDoneCount?,
                                           nextActionDate?, lostReason?, memo? }
```

- GETの各行に `destinationName` / `destinationEmail`（string | null）を含める（2026-08-18 人間指示）:
  案件の元メール（projects.mail_id→mails）の送信元から導出した提案先の会社表示名とアドレス。
  手動登録案件（元メールなし）はnull。DBに専用カラムは持たない
- GETの各行に `projectRequiredSkillsText` / `projectStartYm`（string | null）を含める
  （一覧の「必須技術」「案件開始時期」列の表示用。projectsから導出）
- **提案管理一覧はモック準拠の閲覧専用リスト**（2026-08-18 上流確認で確定）:
  列は 案件名（＋提案先）／必須技術／案件開始時期／要員名／次回アクション日／進捗（ステータス表示のみ）。
  行クリックでメンバー詳細の「提案状況」タブへ遷移。一覧上での編集は行わない
- **カード型レイアウトはメンバー詳細の「提案状況」タブ**（2026-08-18 人間指示）: 提案1件=カード1枚。
  上部に進捗ステッパー6段（提案メール作成中→提案メール送信済み→面談→先方返信待ち→完了→見送り。
  **取下げは見送り位置まで進めて表示、完了(won)は5段目で止める**。面談段は進行中「N回目面談」・通過済み「面談（実施N回）」）、
  左に提案情報（提案先・宛先・面談回数・現在ステータス・次回アクション日）、
  右に更新フォーム（ステータス・次回アクション日・メモ・更新ボタン。差分のみPATCH）。
  マッチング控え（match_snapshot）はカード内の折りたたみ表示

```json
{ "id": 1, "projectId": 3, "personnel": { "id": 1, "name": "..." },
  "status": "draft", "proposalText": "", "matchSnapshot": { "score": 0.72, "matchedSkills": ["Java"] },
  "sentAt": null, "interviewAt": null, "resultAt": null, "lostReason": null, "memo": "" }
```

- status遷移: draft → submitted → interview → won / lost / withdrawn（後戻りは自由。厳密なガードは設けない）
- `interviewAt`（日時・null可）: 面談予定。status=interview 時に画面から入力できる想定
- **includeDone**（2026-08-10 追加）: 未指定/falseなら進行中（won/lost/withdrawn以外）のみ返す。
  `includeDone=true` で全件返す。`status` を明示指定した場合はそのstatusのみ（includeDoneより優先）
- **PATCHの明示null**（2026-08-10 確定）: フィールドが**JSONに存在しない**=更新しない、
  **明示的に null**=クリア（DBをNULLに更新）。対象は interviewAt / nextActionDate / lostReason / memo
  （interviewDoneCount・nextActionDateは2026-08-17の提案改修で追加。2026-08-19契約追記）。
  フロントは面談日時入力を空にしたら `interviewAt: null` を送る
- 提案一覧のユースケース（2026-08-07 人間イメージ）: **「今どこの案件に誰が提案中で、いつ面談で、
  ステータスがどうか」を横断で一覧できること**。一覧のデフォルトは進行中（won/lost/withdrawn以外）を
  status順・interviewAt昇順で表示
- `matchSnapshot`: 作成時点の candidates 該当行を凍結保存（JSON）

## スキルマスタ

```
GET /ses/skills?q=                       タグ入力のサジェスト用（alias込みで検索）
```

- ~~登録・エイリアス管理APIはPhase 1では作らない~~ → **育成画面（A2）実装により方針変更（2026-08-18実装・2026-08-19契約追記）**:
  ```
  GET  /ses/skill-master/unknown-terms?status=   登録待ちスキル一覧（頻度順）
  GET  /ses/skill-master/unknown-terms/{id}      判断材料つき詳細
  POST /ses/skill-master/decision                登録/別名/却下/差し戻しの判断（該当案件へ自動再紐付け）
  POST /ses/skill-master/merge                   スキル統合（マージ。破壊的操作・対象ID必須）
  POST /ses/skill-master/relink                  全件再照合（全消し再構築。required_years引き継ぎ）
  GET  /ses/skill-master/skills                  マスタ一覧
  ```
- マスタ未登録の語は unknown_terms に蓄積し、スキルマスタ画面の**「登録待ちスキル」タブ**
  （旧称: 未知語トリアージ。2026-08-18改名）で 登録/別名/対象外 の3択で判断する

## マッチング結果画面（2026-08-19 決定#30）

マッチングの確認・操作の中心を新設の「マッチング結果画面」に移す。

- **一覧2箇所**（メンバー詳細のマッチングタブ／マッチング一覧）は縦リストで列=
  案件名・点数・一致スキル・不足スキル・ステータス・**見送りボタン**。行クリックで結果画面へ遷移
- **結果画面の構成**: 左=案件×要員の**対比表**（下記API）。右=この案件の重複メール縦リスト
  （フレーム内スクロール。各行=送信元会社名・メールアドレス・件名・受信日＋該当案件メール詳細への
  リンク＋**提案ボタン**=どのメール経由で提案するかの選択）。フレーム外下に**見送りボタン**（案件基点）。
  承認は3段階（確認中→承認済み→提案）を維持し、**承認ボタンも結果画面に配置**
- **同一案件のグルーピングは自動判定を精度検証後に導入**（Phase 2。タイトル類似・スキル集合等の
  ヒューリスティックを実メールで検証してから基準確定）。それまで右側は案件の元メール1件のみ表示

```
GET /ses/matching-result?projectId=&personnelId=
```

```json
{ "project": { "id": 1, "title": "...", "location": "..." },
  "personnel": { "id": 1, "name": "..." },
  "matching": { "status": "approved", "rejectReason": null, "memo": null },
  "hasProposal": false,
  "score": 0.72, "skillScore": 0.8, "conditionFactor": 0.9,
  "skillComparison": [
    { "skillName": "Java", "required": true, "requiredYears": 5,
      "personnelHas": true, "personnelYears": 3, "verdict": "warn", "highlight": "personnel" } ],
  "conditionComparison": [
    { "axis": "price", "projectValue": "〜55万円", "personnelValue": "45〜55万円",
      "status": "OK", "highlight": null, "reason": "..." } ],
  "mails": [ { "mailId": 137, "projectId": 1, "senderName": "...", "senderAddress": "...",
               "subject": "...", "receivedAt": "2026-08-18 09:00" } ] }
```

- `skillComparison`: 案件スキル（必須+尚可）ごとに要員側の充足を対比。
  verdict= `ok`（一致・年数充足or要求なし）/ `warn`（一致だが要求年数に不足→**要員側ハイライト**）/
  `ng`（要員に該当スキルなし）。判定は既存のスキル評価・skillYears軸と同一ロジック
- `conditionComparison`: 条件8軸ごとに案件側・要員側の**生値（表示文字列）**と判定を対比。
  highlight=「基準を満たさない値を持つ側」: 単価・稼働形態=案件側／開始時期・年齢・商流・
  外国籍・個人事業主・経験年数=要員側（例: 案件単価が要員希望に届かない→案件側△ハイライト）。
  値が無い側は「-」・status=OK（判定材料なし）でハイライトなし
- `mails`: Phase 1では案件の元メール1件（手動登録案件は空配列）。Phase 2でグループ内の全メール

```
POST /ses/proposals  { projectId, personnelId, proposalText?, viaMailId? }   ※viaMailId追加（2026-08-19）
```

- `viaMailId`: どのメール経由で提案するかの選択（結果画面の提案ボタン）。省略時は案件の元メール。
  `proposals.via_mail_id`（NULL可）に保存し、**提案先（destinationName/Email）の導出は
  via_mail_id優先**（無ければ従来どおりprojects.mail_id）

## その他の実装済みエンドポイント（2026-08-19契約追記）

```
GET  /ses/matchings?status=                マッチング一覧（閲覧専用。候補行+承認状態+提案有無の合成、上限200行）
POST /ses/matchings/decision               承認/見送り/確認中に戻す { projectId, personnelId, status, rejectReason?, memo? }
GET  /ses/staff-candidates?…               要員候補（メール由来）一覧・PUT /ses/staff-candidates/{id} 更新（確認/非表示）
GET  /ses/mails/{id}                       メール原文参照（一般ロールはkind=案件のみ）
POST /ses/mail-import/run                  取込の手動実行（202+running。実行中は400）
GET  /ses/mail-import/runs                 取込履歴（実行ヘッダ+アカウント別明細の2階層）
```

## エラー応答の規定（/ses/** 共通。2026-08-19 決定#29で確定）

- **バリデーション違反（必須欠落等）・未知のenum文字列**: **400・空ボディ**（詳細はサーバログ）。
  未知enum文字列は検索パラメータ・更新ボディを問わず**一律400**（サイレント無視・絞り込み解除・
  サービス委譲だった実装のばらつきを統一。理由: フロントは固定選択肢のみ送るため、未知値=バグか手打ち。
  黙って通すと「更新した/絞り込めたつもり」の事故になる）
- **対象が存在しない（ID不一致等）**: 404・空ボディ
- **その他の業務エラー（サービス層のエラーコード）**: 400・空ボディ（manage-user系など既存の
  個別コード規約を持つAPIはそちらが優先）
