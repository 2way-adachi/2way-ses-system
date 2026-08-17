# Phase1 レビュー残タスク（S3: 追いタスク）

2026-08-09〜10のレビュー3本（クリーンルームFable×2 + 別口）のうち、
即修正（S1/S2、2026-08-10対応）に含めなかった指摘の管理リスト。

## thyme

- [ ] enum未知文字列が黙って0（available/employee/open）にフォールバック（SesEnumConverter）。未知値は400で弾く。proposalStatusのみnull返しで不統一
- [ ] 存在しないIDへのPUTが400（PersonnelController）。ProposalControllerは404で不統一 → 404に統一
- [ ] PUTがupdateByPrimaryKeySelectiveのためフィールドをnullに戻せない（PUT=全置換の意味論と不一致）
- [ ] LIKE検索の `%` `_` 未エスケープ（Personnel/Project/SkillService）
- [ ] matchSnapshotの読み出しViewにmissingSkillsが無い（保存はしている）。フロント型と整合させる
- [ ] マッチングのN+1（全open案件/要員に対しループ内スキル取得）。件数増加時にバッチ化
- [ ] CORSのGET/PUT/PATCH追加が全エンドポイントに波及している範囲の妥当性確認
- [ ] 非管理者への項目除外（勤怠提出元等）はサーバー側で必須（フロント絞り込みは表示整形にすぎない）
- [ ] thyme.code-workspace の端末固有JDK絶対パスをコミット対象から外す
- [ ] docs/plans/2026-05-06-store-qr-*.md（StoreQR設計、SES無関係）はコミットを分ける
- [ ] H2テスト用DDLへ mails / staff_candidates を追加（skill-sheet側テスト実装時）
- [ ] JaCoCo 0.8.6がJDK17非対応（Unknown block type 61）。バージョンアップ or CI側JDK11で運用確認

## Lavender

- [ ] スキルシート一覧の検索がページ内のみ（サーバーページングと不整合）。一覧API実装時に検索条件をリクエストへ移す（型は定義済み: keyword/employmentStatus/attendanceSubmissionSource）
- [ ] IndexedDB既存レコードに role が無く undefined が number 型に流れる（`items[0].role ?? -1` 推奨）
- [ ] ステータスバッジの dangerouslySetInnerHTML（現状静的文字列のみで安全。動的値を入れない運用の維持 or Chip対応）
- [ ] skillSheetPrint.scss の `@page` / `@media print` がグローバルに効く副作用の認識
- [ ] skillSheetEdit: 経歴カード key=index（並べ替えでフォーカス移動の可能性）、追加/削除の非関数型更新レース、新規作成直後の全項目赤エラー
- [ ] proposalList の window.location.search 直読み → useLocation へ（ブラウザバック追従）
- [ ] STATUS_LABEL等の重複ヘルパーを views/ses/shared/ に集約
- [ ] モック日時の toISOString()（UTC）が契約のローカル形式とズレ
- [ ] skillSheetPrint の "yyyy-MM" を new Date() でパース（負オフセットTZで前月ズレ。日本限定なら許容）

## 権限（本対応）

- [ ] `/ses/**` の manage_user 認可接続（S1-1の暫定ガードの本対応）。参照権限と更新権限のサーバー側分離。skill-sheet機能のTask8と同時実施が効率的
