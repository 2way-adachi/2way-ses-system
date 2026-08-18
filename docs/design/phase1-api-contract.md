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
- 条件適合は `conditionChecks` に項目別の判定と理由を保持する（7軸。2026-08-18 決定#25）
  - `price` / `workStyle` / `startDate` / `age` / `commercialFlow`: `OK` / `WARNING` / `NG`
  - `nationality` / `freelancer`（個人事業主）: `OK` / `NG`
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
PATCH /ses/proposals/{id}                { status?, proposalText?, interviewAt?, lostReason?, memo? }
```

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
  **明示的に null**=クリア（DBをNULLに更新）。対象は interviewAt / lostReason / memo。
  フロントは面談日時入力を空にしたら `interviewAt: null` を送る
- 提案一覧のユースケース（2026-08-07 人間イメージ）: **「今どこの案件に誰が提案中で、いつ面談で、
  ステータスがどうか」を横断で一覧できること**。一覧のデフォルトは進行中（won/lost/withdrawn以外）を
  status順・interviewAt昇順で表示
- `matchSnapshot`: 作成時点の candidates 該当行を凍結保存（JSON）

## スキルマスタ

```
GET /ses/skills?q=                       タグ入力のサジェスト用（alias込みで検索）
```

- 登録・エイリアス管理APIはPhase 1では作らない（シードSQLで投入、追加はSQL運用）
- 未知語プール（unknown_terms）はバックエンド内部で蓄積のみ。画面なし
