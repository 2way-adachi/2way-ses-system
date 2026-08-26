# Phase 1 API契約（マッチング・提案管理）

作成: 2026-08-07 / 対象: matching-design.md の Phase 1（LLMなし・ランニングコストゼロ）
フロント（Lavender）とバック（thyme）はこの契約を正とする。変更時は本ファイルを先に更新。

## パス・共通

- ベースパス: `/ses`（thyme既存のコントローラ規約に合わせて調整可。変えたら本ファイル更新）
- 日時はJST、`yyyy-MM-dd` / `yyyy-MM-dd HH:mm:ss`
- ページング: `?page=&size=`
- **一覧3本のサーバーサイドページング（2026-08-21 タスクT1・人間決定）**:
  `GET /ses/projects`・`GET /ses/staff-candidates`・`GET /ses/matchings` は
  リクエスト `page`（int・**0起点**）/ `size`（int）を受け、レスポンスは封筒形式
  `{ "items": [...], "total": n }` で返す（`total` は**絞り込み適用後**の総件数。
  TablePaginationの件数表示に使う）
  - 不正・範囲外の値は既定値へ丸める（J2のURL検証と同方針）: `page` が負数・非数→0、
    `size` が {50,100,200,500} 以外→100。最終ページ超えの `page` は空 `items`＋正しい `total` を返す
  - 並び順は従来どおり（案件・要員はid降順。ページングは順序安定が前提）
  - **マッチング一覧の注意**: 評価対象母集団に `LIST_LIMIT=200`（スコア降順の上位200件・評価コスト抑制目的）の
    頭打ちが**ページングより手前に**存在する。`total` はこの200件へのフィルタ適用後件数であり、
    スコア201位以下は件数にも紙面にも現れない（2026-08-21 T3実装判断。レビュー指摘により明記）
  - フロントのURLクエリは従来どおり1起点（`?page=1`）のまま。API呼び出し時に0起点へ変換する

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
- 一覧の `q` は前後空白を除去し、氏名・最寄駅・保有スキルの正規名/別名のいずれかへ部分一致する。
  3項目はOR、`type`・`status`とはANDで組み合わせる（2026-08-26 タスクAF）
- BPの場合 `partnerCompany` (string) を追加で持つ
- **スキル入力の一本化（2026-08-21 タスクX・[設計](skill-input-unification.md)）**:
  `POST/PUT /ses/personnel` の入力から `skills[]` を**廃止**（送っても無視。`personnel_skills` の
  書き込みはスキルシート保存時の同期と昇格コピーのみ）。レスポンスの `skills[]` は従来どおり返す
- `createDatetime` (string `yyyy-MM-dd HH:mm:ss`・登録日時) を一覧・詳細とも返す（2026-08-21 タスクR2。画面表示は社員=「入社日」/BP=「提案日」のラベルで日付部分のみ。
  BPの提案日は昇格日=登録日時でよい（元メール受信日への遡りはしない・2026-08-21 人間判断））
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

- `startYm` はレスポンスでも `string(yyyy-MM)` で返す（案件・要員候補とも共通。2026-08-21 明記。
  DBは `date` 型だが日は01固定の内部表現であり、APIの入出力は年月のみ。
  画面バリデーション `^\d{4}-(0[1-9]|1[0-2])$` と整合させる。タスクN2）
- `location` は表示・営業判断用。初期版では自動判定対象にしない
- `nationalityAllowed` は外国籍可否の条件判定に利用する
- `ageLimit` は案件側の年齢条件として、要員年齢（`birthDate` から算出）との条件判定に利用する
- `commercialFlow` は社員のみ/BP可などの条件判定に利用する

## マッチング（①ハードフィルタ＋②タグ粗マッチ）

```
GET /ses/projects/{id}/candidates        案件→候補要員（上位20）
GET /ses/personnel/{id}/matches          要員→適合案件
    ?status=&projectTitle=&scoreMin=&page=&size=   ※2026-08-25 サーバーページング化
```

- **進行中の提案がある組（hasProposal=true）は常に一覧から除外する**（2026-08-25 人間提案。
  `GET /ses/matchings`・`GET /ses/personnel/{id}/matches` の両方に適用）。旧`unproposedOnly`
  パラメータ（承認済み＆提案未作成のみに絞るトグル）はこの既定除外に統合されたため**廃止**した。
  旧クライアントが`unproposedOnly`クエリを送っても未知パラメータとしてサーバー側でサイレントに無視される
  （400にはしない）。除外判定はhasProposalの定義（決定#37「進行中の提案があるときだけtrue」）に従うため、
  lost/withdrawn/joined後は一覧へ自然に再登場する。wonは参画前の進行中として除外を継続する
  （旧トグルにあった`UnproposedBadge`は不要になった。
  除外方式では一覧に残る承認済みは全て未提案のため）

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
- 条件適合は `conditionChecks` に項目別の判定と理由を保持する（9軸。2026-08-18 決定#25・#26／2026-08-19 決定#34）
  - `price` / `workStyle` / `startDate` / `age` / `commercialFlow`: `OK` / `WARNING` / `NG`
  - `nationality` / `freelancer`（個人事業主）: `OK` / `NG`
  - `skillYears`（経験年数）: `OK` / `WARNING`（**NGなし**。2026-08-18 決定#26）
  - `location`（勤務地の地方）: `OK` / `WARNING` / `NG`（2026-08-19 決定#34。それ以前は自動判定なしだった）
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
  - **運用注意（2026-08-20 実測）**: `relink`（全件再照合）は required_years を
    「原文照合で同じ (project_id, skill_id) を再現できた行」だけに引き継ぐため、
    表記ゆれ等で再現できない行の年数は失われる（実測 141件→122件）。
    **relink実行後は skill-years-backfill を続けて流す**のを標準手順とする
  - `skillYears`: 一致スキルのうち、案件側に要求年数（`project_skills.required_years`。取込時にLLM抽出=prompt v4）が
    あり、要員の経験年数が不足するものが1つでもあれば **WARNING**（軸として1件。複数スキル不足でもWARNINGは1つ）。
    理由に不足スキルを列挙（例「Java: 要求5年 / 要員3年」）。要員側の年数未登録・案件側の要求年数なしは判定対象外
    （すべて対象外ならOK＋「判定材料なし」）。**NGにはしない**（「目安」「〜程度」表現が多く、
    ハード足切りは実態より厳しくなるため。精度検証は skill-years-extraction-verification.md）
  - `location`: 案件の勤務地と要員の所在地を**8地方区分**（北海道/東北/関東/中部/関西/中国/四国/九州沖縄）に
    正規化して突き合わせる。上から評価し最初に該当した行で確定する:
    ①`location` に否定キーワード（`地方不可` 等）→ 地方一致必須・不一致はNG ／ ②案件フルリモート（`remote_type=0`）→ OK ／
    ③案件併用かつ低頻度出社キーワード（`基本リモート` 等）→ 不一致ならWARNING ／ ④どちらかの地方が特定できない → OK＋「判定材料なし」 ／
    ⑤一致 → OK ／ ⑥不一致 → NG。
    要員側の解決順はメンバーが `prefecture`→`preferredLocation`→`nearestStation`、要員候補は `nearestStation` のみ。
    複数地名の併記（`六本木一丁目駅or金沢駅`）はいずれか一致でOK。同名地名（本町・府中・大手町・淡路）は
    辞書から除外し「判定材料なし」に倒す（詳細は [location軸 設計](matching-location-axis.md)）。
    結果画面の対比（conditionComparison）でのハイライト側は **project**（勤務地は案件側の条件なので
    `workStyle` と同じ扱い。2026-08-20 実装と突き合わせて確定）
- **重複件数の表示（G1）**: 案件行を返すAPI（案件メール一覧・マッチング一覧・適合案件）は
  `duplicateCount`（int。**グループ内の総件数=代表自身を含む**。グループ未判定・単独は1）を含める。
  フロントは2以上で「重複N件」バッジ表示（2026-08-20 フィールド名確定）
- 条件適合に `NG` が1件でも含まれる場合はマッチング対象外とし、候補一覧には返さない
- `NG` がない場合、`WARNING` 件数に応じて `conditionFactor` を決め、総合点 `score` を算出する
  - `WARNING` 0件: `conditionFactor = 1.00`
  - `WARNING` 1件: `conditionFactor = 0.90`
  - `WARNING` 2件: `conditionFactor = 0.80`
  - `WARNING` 3件以上: `conditionFactor = 0.70`
  - `score = skillScore * conditionFactor`
- `matchedSkills` は決定#22-Aにより `{name, years|null}` 構造（要員の経験年数を併記。missingSkillsは名前配列のまま）
- 場所の参考表示用に、候補側refは要員の `nearestStation`・`preferredLocation` を、適合案件側refは案件の
  `location` を含める（`location` 軸の判定結果とは別に、営業判断材料として原文を並記するため）
- `reason` は **Phase 2（LLM）用の席**。Phase 1では常にnull。フロントはnull時に非表示
- レスポンス形状: `/projects/{id}/candidates` は `{ "candidates": [...] }`（2026-08-07 確定）。
  `/personnel/{id}/matches` は `{ "items": [...], "total": n }` へ変更（2026-08-25
  メンバー詳細マッチングタブのサーバーページング化。中身の行構造は従来と同一）
- **適合案件のサーバーページング・絞り込み（2026-08-25）**: `/personnel/{id}/matches` は
  従来の「上位20固定」を撤廃し全件を対象にする（表示はページングで制御。devDB実測で
  メンバーあたり中央値325件・最大444件）。絞り込みは `/ses/matchings` と同じ後段フィルタ方式:
  - `status`（pending|approved|rejected。未知文字列は400）
  - 進行中の提案がある組（hasProposal=true）は既定で除外する（2026-08-25 unproposedOnly廃止。上記参照）
  - `projectTitle`（部分一致）
  - `scoreMin`（0〜100整数。scoreがnullの行=判断済み末尾保証行の扱いは `/ses/matchings` と同一）
  - `page` / `size`（不正・範囲外は例外にせず既定値へ丸める。SesPagingParser準拠）
  - `total` はフィルタ適用後・ページ切り前の総件数。ソートはスコア降順、判断済み末尾保証行は末尾
  - `personName` / `subjectType` は本人固定のため受けない
- **並び順（2026-08-25 人間指示）**: `/ses/matchings`・`/personnel/{id}/matches` に `sort` を追加。
  `score`（既定・スコア降順）| `priceDesc`（案件 `unit_price_max` 降順・null末尾・二次キーはスコア降順）。
  未知文字列は400。適用順はフィルタ→ソート→ページング。行に表示用 `unitPriceMax` を追加
- **不足スキル集計（2026-08-25 人間指示・推奨最小構成で実装）**: `GET /ses/personnel/{id}/skill-gap-summary`。
  母集団は「fresh open案件×共通スキル1件以上」で **NG除外なし**（進めない理由を数えるのが目的）。
  必須スキル（project_skills.required）のうち未保有をスキル別に集計し、
  `{items:[{skillId, skillName, description, projectCount, bandCounts:{under60,from60to79,over80,unknown}, fullRemoteCount}]}`
  （単価帯は unit_price_max 基準 60万未満/60〜79万/80万以上/null、projectCount降順・上位20件）を返す。
  画面はメンバー詳細マッチングタブ上部の小パネルに上位5件表示。
  **`maxPrice`は2026-08-25 A3で廃止し`fullRemoteCount`（そのスキルを必須とする案件のうち
  remoteType=full_remote(0)の件数）に置き換えた**（「このスキルがあれば〜円/フルリモート案件が開ける」
  というベネフィット提示への見せ方変更に伴う。bandCountsは維持するがフロント表示はover80のみ使用。
  print-preview-tasks.md A3参照）
  - **`description`（string | null。2026-08-26 E6追加）**: `skills.description`（E6のスキル概要）を
    そのまま返す。未生成のスキルはnull。フロントは不足スキル分析カードのスキル名ツールチップに使う。
    一般ロール（E2の本人ビュー）にも同一値を返す（概要は営業の内部判断情報ではなく公開情報のため、
    E2の判断系フィールド遮蔽の対象外）
- **鮮度表示（2026-08-25 人間指示）**: `/personnel/{id}/matches` の各行に `mailReceivedAt`
  （string | null。案件の元メール受信日時。手動登録案件=mail_idなしはnull）を含める。
  案件はすぐ埋まるため受信日時を営業判断の鮮度指標として画面に出す
- **本人向け利用の許可（2026-08-26 E2）**: `GET /ses/personnel/{id}/matches`・
  `GET /ses/personnel/{id}/skill-gap-summary` は一般ロール（manage_userの非管理者）にも許可する。
  一般ロールは**自分に紐付くpersonnelIdのみ**アクセスでき、他人のIDは存在有無も伏せて404
  （`GET /ses/personnel/{id}`と同じ本人スコープの作法。SesScopeGuard）
  - `GET /ses/personnel/{id}/matches` は一般ロールアクセス時、**応答の型自体が変わる**
    （nullで隠すのではなく、判断系フィールドを持たない別の型で返す）:
    `{items:[{project, score, skillScore, conditionFactor, conditionChecks, matchedSkills,
    missingSkills, reason, duplicateCount, mailReceivedAt, unitPriceMax}], total}`
    （管理者向けの行から `matchingId`/`matchingStatus`/`rejectReason`/`memo`/`decidedAt`/
    `hasProposal` を除いたサブセット。承認/見送り状態・見送り理由・営業メモ・判断日時・提案有無は
    「営業の内部判断が本人に見えると軋轢の元」となるため一般ロールには一切返さない。実装は
    `SesProjectMatchSelfView`/`SesMatchesSelfResponse`。管理者は従来どおり`SesMatchesResponse`）
  - `status` クエリパラメータは**一般ロールでは常に無視する**（絞り込みを適用しない）。
    出力フィールドを隠すだけでは `status=rejected` 等を指定して結果の有無を見ることで
    判断状態を間接的に推測できてしまうため、絞り込み自体を効かせない
  - **一般ロールは進行中の提案がある組（hasProposal=true）も除外せず全件返す**（2026-08-26
    追加の人間決定）。管理者は従来どおり既定除外（本セクション冒頭の「進行中の提案がある組は
    常に一覧から除外する」）を維持する。hasProposal自体が一般ロール向け応答に含まれない
    （上記の別View方式）ため、全件見せても提案の有無という判断情報は漏れないという判断。
    実装は`MatchingFillArgData.includeProposed`（一般ロール時にController側でtrue指定。
    `GET /ses/matchings`・管理者の`/personnel/{id}/matches`はこのフラグを見ない＝常に除外のまま）
  - `GET /ses/personnel/{id}/skill-gap-summary` は判断系フィールドを持たない集計のため、
    一般ロールでも管理者と同一の応答形（本人スコープの404判定のみ追加）

## 提案 proposals

```
GET   /ses/proposals?projectId=&personnelId=&personnelName=&status=&includeDone=   ※レスポンスは配列直返し（2026-08-07 確定）
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
  行クリックでメンバー詳細の「提案状況」タブへ遷移。一覧上での編集は行わない。
  検索欄はメンバー名（`personnelName` の前後空白除去・部分一致）／ステータス／完了案件表示。
  案件ID・メンバーIDは画面の検索欄には出さず、詳細画面からの導線用クエリとしてのみ互換維持する
  （2026-08-26 タスクAG）
- **カード型レイアウトはメンバー詳細の「提案状況」タブ**（2026-08-18 人間指示）: 提案1件=カード1枚。
  上部の進捗ステッパーは提案準備中→提案メール送信済→1回目面談済→…→N回目面談済→結果。
  結果確定前は4段目を「結果」と表示し、確定後は「採用」または「見送り」に置き換える。
  採用の場合だけ末尾に「参画」を追加する（`joined`）。面談回数は`interviewDoneCount`から動的表示する。
  左に提案情報（提案先・宛先・面談回数・現在ステータス・次回アクション日）、
  右に更新フォーム（ステータス変更は次のステップと見送りだけ、次回アクション日・メモ・更新ボタン。差分のみPATCH）。
  マッチング控え（match_snapshot）はカード内の折りたたみ表示

```json
{ "id": 1, "projectId": 3, "personnel": { "id": 1, "name": "..." },
  "status": "draft", "proposalText": "", "matchSnapshot": { "score": 0.72, "matchedSkills": ["Java"] },
  "sentAt": null, "interviewAt": null, "resultAt": null, "lostReason": null, "memo": "" }
```

- 画面からのstatus遷移: draft（提案準備中）→ submitted（提案メール送信済）→ interview（面談回数を加算）→
  won（採用）→ joined（参画）。最終面談済みでは結果を選択肢に出さず、won（採用）またはlost（見送り）を
  直接選択する。waiting_reply（結果）は既存データ互換として維持し、表示時は採用/見送りを選択可能。
  withdrawn（取下げ）は既存データ互換のため読み取りを維持する（2026-08-26 タスクAI）
- `interviewAt`（日時・null可）: 面談予定。status=interview 時に画面から入力できる想定
- **includeDone**（2026-08-10 追加、2026-08-26参画追加に伴い再定義）: 未指定/falseなら進行中（lost/withdrawn/joined以外）のみ返す。won（採用）はjoined（参画）へ進む途中状態として進行中に含める。
  `includeDone=true` で全件返す。`status` を明示指定した場合はそのstatusのみ（includeDoneより優先）
- **PATCHの明示null**（2026-08-10 確定）: フィールドが**JSONに存在しない**=更新しない、
  **明示的に null**=クリア（DBをNULLに更新）。対象は interviewAt / nextActionDate / lostReason / memo
  （interviewDoneCount・nextActionDateは2026-08-17の提案改修で追加。2026-08-19契約追記）。
  フロントは面談日時入力を空にしたら `interviewAt: null` を送る
- 提案一覧のユースケース（2026-08-07 人間イメージ）: **「今どこの案件に誰が提案中で、いつ面談で、
  ステータスがどうか」を横断で一覧できること**。一覧のデフォルトは進行中（lost/withdrawn/joined以外）を
  status順・interviewAt昇順で表示
- `matchSnapshot`: 作成時点の candidates 該当行を凍結保存（JSON）

## スキルマスタ

```
GET /ses/skills?q=                       タグ入力のサジェスト用（alias込みで検索）
```

- 応答は `[{skillId, skillName, category}]`（2026-08-25 `category` を後方互換で追加。0:言語/1:FW/2:DB/
  3:OS/4:インフラ/5:ツール/6:その他）。スキルシート編集の経歴チップサジェストで、使用技術（0,1,6）と
  使用環境（2,3,4,5,6）へ候補を出し分けるために使う（絞り込みはフロント側。入力済みチップと同名の
  候補は正規化比較で除外）

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

- **関連スキル（タスクY1a・詳細設計: [skill-relation-suggest.md](20260821_1442_skill-relation-suggest.md)）**:
  ```
  GET  /ses/skills/{id}/related                     承認済み関連スキル（両方向解決・起点視点へ正規化）
  GET  /ses/skill-master/relations?status=pending    承認待ち一覧（管理者のみ。statusはpending固定・他は400）
  POST /ses/skill-master/relations/decision          承認/却下 { skillRelationId, approve }
  POST /ses/skill-master/relations/generate          LLM関連スキル生成（同期実行）{ all? }
  ```
  - `GET /ses/skills/{id}/related`・`GET /ses/skill-master/relations` はいずれも**封筒形式
    `{"items": [...]}`** で返す（2026-08-25 バグ修正で明記: `relations` が素配列を返しており
    Lavender `skillMasterApi.ts` の `res.data.items` 前提と食い違い、関連スキル承認タブが
    白画面になっていた。`SesPendingSkillRelationListView` で修正済み）
  - `POST /ses/skill-master/relations/generate` の応答は `{ "generated": n, "skipped": n }`

- **スキル概要（3行以内の説明。2026-08-26 E6）**: 営業の商談支援・メンバー本人の学習アクション支援
  （E2の不足スキル分析と相乗り）・トリアージ誤登録防止（多義語・紛らわしい略語の再発防止）が目的。
  ```
  GET   /ses/skill-master/skills                      応答に description を追加（後方互換。未生成はnull）
  PATCH /ses/skill-master/skills/{id}                  { description }（人間編集。空文字/未指定はnullとして保存）
  POST  /ses/skill-master/description-backfill         一括生成（同期実行。body無し）
  ```
  - DDL: `skills.description` TEXT NULL を追加（`docs/ddl/schema-ses.sql`。devDB適用は別途人間判断）
  - 生成: gpt-5.6-luna相当。プロンプトは「SES案件の文脈で、非エンジニアの営業にも分かる3行以内」＋
    その語が登場した実案件メールの文脈行（project_skills→projects→mailsを辿り最大3本。正規名・別名の
    どちらかを含む行）を添えて背景補完する（多義語の曖昧性解消・ニッチ語のハルシネーション抑制）
  - `POST /ses/skill-master/description-backfill` は **description IS NULLの登録済みスキルのみ**が対象
    （`all`のような全件再生成トグルは持たない）。応答は
    `{ "targetSkills": n, "processedSkills": n, "failedSkills": n }`（skill-years-backfillと同じ
    対象/処理/失敗件数の作法）。実行中の重ね実行は400。LLM回復不能失敗（abort）は500・空ボディ
    （relations/generateと同方針）
  - **登録decision（ACTION_REGISTER）成功後に自動生成1コール**（2026-08-26実装確定）。
    `POST /ses/skill-master/decision` のレスポンス自体は変わらないが、内部でdecision確定後に
    `SkillDescriptionService.generateForNewSkill()` を呼ぶ。**失敗しても登録自体は成功させる**
    （概要はNULLのままdescription-backfillで後から埋められる。人間が既に概要を編集済み＝NULL以外の
    場合は上書きしない、という判断もここに含む）
  - LLM生成は初期値扱いで、`PATCH /ses/skill-master/skills/{id}` からマスタ一覧の人間が編集・上書きできる
  - 表示先: マスタ一覧＋不足スキル分析・マッチング内訳のツールチップ（Lavender側実装）
  - 対象は登録済みスキルのみ（未知語側は既存のexampleProjects/similarSkillsで足りるため対象外）
  - マッチングロジックへの影響なし（表示専用のフィールド）

## マッチング結果画面（2026-08-19 決定#30）

マッチングの確認・操作の中心を新設の「マッチング結果画面」に移す。

- **一覧2箇所**（メンバー詳細のマッチングタブ／マッチング一覧）は縦リストで列=
  案件名・点数・一致スキル・不足スキル・ステータス・**見送りボタン**。行クリックで結果画面へ遷移
- **結果画面の構成**: 左=案件×要員の**対比表**（下記API）。右=この案件の重複メール縦リスト
  （フレーム内スクロール。各行=送信元会社名・メールアドレス・件名・受信日＋該当案件メール詳細への
  リンク＋**提案ボタン**=どのメール経由で提案するかの選択）。フレーム外下に**見送りボタン**（案件基点）。
  承認は3段階（確認中→承認済み→提案）を維持し、**承認ボタンも結果画面に配置**
- **同一案件のグルーピングを実装**（2026-08-20。決定#30・G1）: タイトル正規化一致＋勤務地トークン交差
  （どちらか空はスキップ）＋単価レンジ1.15倍未満で判定し、`projects.group_id`/`matchings.group_id` に永続化。
  グループ代表（受信最新のもの）とのみ照合する。取込時＋手動更新時に付与、既存分は
  `POST /ses/projects/group-backfill` でバックフィル（対象=group_id未設定。受信の古い順に処理）。
  承認・見送り（`POST /ses/matchings/decision`）はgroup_id×(personnelIdまたはstaffCandidateId)を実質キーとして
  同一グループ内で引き継ぐ（project_idは「どの案件を見て判断したか」の記録として残すのみ）。
  マッチング一覧・適合案件の評価母集団はグループ代表のみに絞る（重複件数は`duplicateCount`。上記参照）

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
               "subject": "...", "receivedAt": "2026-08-18 09:00" } ],
  "staffMails": [ { "mailId": 212, "staffCandidateId": 9, "senderName": "...", "senderAddress": "...",
                     "subject": "...", "receivedAt": "2026-08-19 10:00" } ] }
```

- `skillComparison`: 案件スキル（必須+尚可）ごとに要員側の充足を対比。
  verdict= `ok`（一致・年数充足or要求なし）/ `warn`（一致だが要求年数に不足→**要員側ハイライト**）/
  `ng`（要員に該当スキルなし）。判定は既存のスキル評価・skillYears軸と同一ロジック
- `conditionComparison`: 条件8軸ごとに案件側・要員側の**生値（表示文字列）**と判定を対比。
  highlight=「基準を満たさない値を持つ側」: 単価・稼働形態=案件側／開始時期・年齢・商流・
  外国籍・個人事業主・経験年数=要員側（例: 案件単価が要員希望に届かない→案件側△ハイライト）。
  値が無い側は「-」・status=OK（判定材料なし）でハイライトなし
- `hasProposal`: **進行中の提案があるときだけtrue**（2026-08-20 人間指示で定義変更。
  進行中=lost/withdrawn/joined以外。提案一覧`includeDone`と同じ線引き）。見送り・取下げ・参画後は
  falseに戻り再提案できる。以前はステータスを問わず提案の有無だけを見ていたため、一度提案すると
  見送られた後も同一案件×同一要員に二度と提案できない不具合があった。阻止したいのは
  「同一案件×同一要員の進行中の二重提案」のみ。候補（staffCandidate）ペアのhasProposalは
  従来どおり常にfalse（提案は候補の昇格後のみ可能なため）
- `mails`: 同一案件グループ内の全メール（2026-08-20実装。未グルーピングの案件は自分の元メール1件のみ。
  手動登録案件は空配列）。受信日時の新しい順
- `staffMails`: 同一要員名寄せグループ内の全メール（2026-08-20実装。`staff_candidates.group_id`使用。
  案件側`mails`と対称の位置づけ）。**候補（staffCandidate）ペアのときのみ中身を返し、
  メンバー（personnel）ペアは常に空配列**（メンバーはメール由来ではないため）。
  未グルーピングの候補は自分の元メール1件のみ。受信日時の新しい順。フロントは
  `/staff-mail/{staffCandidateId}` へリンクする。結果画面は右カラム上下2フレーム
  （上=案件メール`mails`／下=要員メール`staffMails`）で、いずれも単一選択（ラジオ相当）。
  フレーム外の提案ボタンは両方選択されて初めて活性

```
POST /ses/proposals  { projectId, personnelId, proposalText?, viaMailId?, viaStaffMailId? }
※viaMailId追加（2026-08-19）・viaStaffMailId追加（2026-08-20）
```

- `viaMailId`: どのメール経由で提案するかの選択（結果画面の案件メールフレーム）。省略時は案件の元メール。
  `proposals.via_mail_id`（NULL可）に保存し、**提案先（destinationName/Email）の導出は
  via_mail_id優先**（無ければ従来どおりprojects.mail_id）
- `viaStaffMailId`: 結果画面の要員メールフレームでどのメール経由で提案するかを選択した場合のみ指定する
  （2026-08-20実装）。`proposals.via_staff_mail_id`（NULL可）に**記録するのみ**で、
  **提案先（destinationName/Email）の導出ロジックは変更しない**（viaMailIdは使わず常に無視。
  従来どおりvia_mail_id優先→projects.mail_id）。存在しないメールIDは400（エラーコード3）

## 要員候補のマッチング参加と昇格（2026-08-19 決定#31）

メール由来の要員候補（staff_candidates。メンバー未昇格のBP）もマッチング対象に加える。

- **タグ付け**: `staff_candidate_skills` 新設（skills_textのマスタ照合。取込時タグ付け＋既存分バックフィル＋
  relink時の再構築対象）。候補側の判定材料: 単価・稼働開始時期・年齢（直接保持値）・商流/個人事業主
  （affiliationから導出）。稼働形態・外国籍・経験年数は判定材料なし扱い
- **一覧・案件詳細候補**: メンバー行と候補行を統合表示。行は `personnel` または `staffCandidate`
  （`{id, nameInitial, affiliation}`）のどちらか一方を持つ。候補行は氏名列=イニシャル＋候補badge、
  **昇格ボタン**＋見送りボタン
- **matchings拡張**: `staff_candidate_id`（NULL可）追加・`personnel_id` NULL可化（どちらか一方必須・
  UNIQUE(project_id, staff_candidate_id)）。`POST /ses/matchings/decision` は `personnelId` または
  `staffCandidateId` のどちらかを受ける
- **昇格API**: `POST /ses/staff-candidates/{id}/promote` → `{ "personnelId": n }`。
  イニシャルを名前として自動でpersonnel作成（name=name_initial・gender・単価・稼働時期→available_from・
  最寄駅・BP区分・affiliationが個人事業主なら freelancer=1）、タグを personnel_skills へコピー（年数NULL）、
  `staff_candidates.personnel_id`（新設）にリンク、候補のmatchings行をpersonnel側へ付け替え。
  昇格済みの再実行は既存personnelIdを200で返す（冪等）。昇格済み候補はマッチングの候補側から除外
  （以後はメンバーとして評価される）
- **結果画面**: `GET /ses/matching-result` は `personnelId` または `staffCandidateId` のどちらかを指定。
  候補ペアの応答は `personnel` の代わりに `staffCandidate` ノード。**提案ボタン押下時、候補ペアは
  自動昇格→提案作成**（フロントが promote→POST /ses/proposals を連続実行）

### マッチングの性能規定（2026-08-19 決定#31）

- **共通スキル前置フィルタ**: 評価対象ペアは共通スキル1件以上のものにSQL段で絞る
  （共通スキル0＝0点のペアは一覧・候補・適合案件に表示されなくなる。承認/見送り済みの組は
  末尾保証で従来どおり残る）
- **鮮度フィルタ**: マッチング評価対象のopen案件は「開始時期が過去でない（start_ym IS NULL または
  当月以降）」かつ「元メール受信から1ヶ月以内（手動登録案件=元メールなしは常に対象）」に限定。
  対象外案件も表示・検索・結果画面の直接参照は可能
- **一覧キャッシュ**: マッチング一覧の評価結果はサーバ内キャッシュ（取込run完了・relink・
  スキルマスタ操作・案件/メンバー/候補の更新・昇格で無効化＋TTL保険。承認/見送り等の状態は
  キャッシュ対象外で都度合成）

## その他の実装済みエンドポイント（2026-08-19契約追記）

```
GET  /ses/matchings?status=                マッチング一覧（閲覧専用。候補行+承認状態+提案有無の合成、上限200行）
POST /ses/matchings/decision               承認/見送り/確認中に戻す { projectId, personnelId, status, rejectReason?, memo? }
GET  /ses/staff-candidates?…               要員候補（メール由来）一覧・PUT /ses/staff-candidates/{id} 更新（確認/非表示）
GET  /ses/mails/{id}                       メール原文参照（一般ロールはkind=案件のみ）
POST /ses/mail-import/run                  取込の手動実行（202+running。実行中は400）
GET  /ses/mail-import/runs                 取込履歴（実行ヘッダ+アカウント別明細の2階層）
```

## 一覧の絞り込み拡張（2026-08-20 決定#42・#40）

3画面（案件メール一覧・要員メール一覧・マッチング一覧）の絞り込みをサーバー側で拡張する。
**判定材料（単価・年齢・開始時期等）がNULLのレコードは、各絞り込みで除外せず通す**方針で統一する
（location軸の「どちらかの地方が特定できない→OK」と同じ考え方。誤って除外すると一覧から消えて
人間が気付けないため）。`q`（フリーワード）と個別項目の絞り込みは**AND結合**（`q`自体は内部的に
対象カラムのOR）。未知のenum文字列は他APIと同じく一律400（決定#29）。

### GET /ses/projects（案件メール一覧。J3）

| パラメータ | 型 | 意味 |
|---|---|---|
| `q` | string | `title`/`description`/`requiredSkillsText`/`preferredSkillsText`/`location`のいずれかに部分一致（従来は`title`のみ） |
| `status` | string | 既存（open/closed） |
| `location` | string | `location`の部分一致 |
| `requiredSkills` | string | `requiredSkillsText`の部分一致 |
| `unitPriceMin` | number(万円/月) | この額以上。`unitPriceMax >= v`。`unitPriceMax`がNULLの案件は通す |
| `unitPriceMax` | number(万円/月) | この額以下。`unitPriceMin <= v`。`unitPriceMin`がNULLの案件は通す |
| `startYmFrom` | string(yyyy-MM) | 指定月の1日以降。`startYm`がNULLの案件は通す |
| `startYmTo` | string(yyyy-MM) | 指定月の1日以前。`startYm`がNULLの案件は通す |
| `remoteType` | string | 完全一致。`remoteType`がNULLの案件は通す |
| `flowLimit` | string | 完全一致。`flowLimit`がNULLの案件は通す |
| `freelancerAllowed` | boolean | 完全一致。`freelancerAllowed`がNULLの案件は通す |
| `foreignNationalAllowed` | boolean | 完全一致。`foreignNationalAllowed`がNULLの案件は通す |
| `region` | string | `1`〜`8`（8地方区分。北海道〜九州沖縄。決定#34の`LocationDictionary`のコードと同値）または`none`（未判定＝`region IS NULL`のみ）。他の絞り込みと異なりNULL許容通過はしない（ピンポイント一致）。`1`〜`8`・`none`以外は400・空ボディ（2026-08-24 タスクAC1） |

`startYmFrom`/`startYmTo`の書式が不正な場合は400・空ボディ。

`region`のバックフィル: `POST /ses/projects/region-backfill`（既存。決定#34）で`projects.region`を再解決できる
（body `{"all": true}`で全件、未指定はregion未設定のみ対象）。

### GET /ses/staff-candidates（要員メール一覧。J4・H7）

| パラメータ | 型 | 意味 |
|---|---|---|
| `q` | string | 既存（`nameInitial`/`skillsText`/`affiliation`/`nearestStation`のOR。変更なし） |
| `status` | string | 既存（変更なし） |
| `promoted` | boolean | true=昇格済み(personnelId有)のみ／false=未昇格(personnelId無)のみ／未指定=両方 |
| `affiliation` | string | 部分一致 |
| `nearestStation` | string | 部分一致 |
| `skills` | string | `skillsText`の部分一致 |
| `ageMin` / `ageMax` | number | 年齢の範囲。`age`がNULLの候補は通す |
| `unitPriceMin` / `unitPriceMax` | number(万円/月) | 案件側と同じ考え方（`unitPriceMax >= min` / `unitPriceMin <= max`）。NULLは通す |
| `startYmFrom` / `startYmTo` | string(yyyy-MM) | `startYm`の範囲。NULLは通す |
| `duplicated` | boolean | true=名寄せグループの件数が2件以上／false=単独(1件)／未指定=両方 |
| `region` | string | `1`〜`8`（8地方区分）または`none`（未判定＝`region IS NULL`のみ）。案件側と同じ値仕様（`1`〜`8`・`none`以外は400・空ボディ）。要員候補は`staff_candidates.region`（最寄駅から解決。2026-08-24 タスクAC2で新設）を参照する |

レスポンスに`duplicateCount`（同一名寄せグループ内の総件数。代表自身を含む。グループ未判定・単独候補は1）を
追加する（H7・決定#40。**案件メール一覧と同じく一覧は畳まず全件表示**したうえで2以上に「重複N件」を表示する
用途）。`startYmFrom`/`startYmTo`の書式が不正な場合は400・空ボディ。

`region`のバックフィル: `POST /ses/staff-candidates/region-backfill`（新設。2026-08-24 タスクAC2。
`POST /ses/projects/region-backfill`と対称）で`staff_candidates.region`を再解決できる
（body `{"all": true}`で全件、未指定はregion未設定のみ対象。最寄駅からの同期辞書引きのみでLLMは使わない）。

### GET /ses/matchings（マッチング一覧。J5）

| パラメータ | 型 | 意味 |
|---|---|---|
| `status` | 既存 | 変更なし |
| `projectTitle` | string | 案件名の部分一致 |
| `personName` | string | メンバー名または候補イニシャルのいずれかに部分一致すればヒット |
| `scoreMin` | number(0〜100の整数) | 総合点の下限。`formatMatchingScore`と同じ0〜100点の整数スケールで指定する（内部は0〜1の小数のため、比較は表示と同じ`Math.round(score * 100)`で丸めてから行う。生の100倍値のまま比較すると浮動小数の丸め誤差で境界値が漏れることがあるため。2026-08-20 人間指示で確定）。計算対象から外れた(score無し)組は指定時に除外される |
| `subjectType` | string | `personnel`=メンバーのみ／`staffCandidate`=要員候補のみ／未指定=両方 |

いずれもマッチング一覧のサーバ内キャッシュ（評価結果）の**後段フィルタ**として適用するため、
絞り込み条件を変えてもキャッシュキー・キャッシュの効きには影響しない。

## エラー応答の規定（/ses/** 共通。2026-08-19 決定#29で確定）

- **バリデーション違反（必須欠落等）・未知のenum文字列**: **400・空ボディ**（詳細はサーバログ）。
  未知enum文字列は検索パラメータ・更新ボディを問わず**一律400**（サイレント無視・絞り込み解除・
  サービス委譲だった実装のばらつきを統一。理由: フロントは固定選択肢のみ送るため、未知値=バグか手打ち。
  黙って通すと「更新した/絞り込めたつもり」の事故になる）
- **対象が存在しない（ID不一致等）**: 404・空ボディ
- **その他の業務エラー（サービス層のエラーコード）**: 400・空ボディ（manage-user系など既存の
  個別コード規約を持つAPIはそちらが優先）
