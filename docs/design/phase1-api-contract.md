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
interviewCount, description` + `status`(open/closed) + `skills[]`（マスタ紐付け済みタグ）

## マッチング（①ハードフィルタ＋②タグ粗マッチ）

```
GET /ses/projects/{id}/candidates        案件→候補要員（上位20）
GET /ses/personnel/{id}/matches          要員→適合案件（上位20）
```

```json
{ "candidates": [ {
    "personnel": { "id": 1, "name": "...", "personnelType": "employee" },
    "score": 0.72,
    "matchedSkills": ["Java", "Spring Boot"],
    "missingSkills": ["AWS"],
    "reason": null } ] }
```

- ①: status=available かつ availableFrom<=案件開始（開始不明なら通す）、
  単価は双方に値がある場合のみレンジ重なり判定
- ②: score = 一致スキル数 / 案件要求スキル数。同点は一致数降順
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
