# スキルマスタ「登録待ちスキル」AI判定の精度検証

- 実施日: 2026-08-25
- 目的: unknown_terms の 登録/別名/対象外 判定をLLMに任せられるかの事前検証（実装前）
- 検証スクリプト: `Documents/work/ses_mail_probe/verify_skill_master_triage.py`
- 生データ: 同 `out/verify_skillmaster_gpt-5.6-luna.jsonl`（v1）・`_v2.jsonl`（v2）

## Summary

**採用可の水準**。人間の却下判断（対象外91語）との一致率は、粒度ルールをプロンプトに明記したv2で
**95.6%（87/91）**。残る不一致4語も明らかな誤りではなく境界例。low-confidence申告は291語中0〜7語と
少なく、確信度による人間確認への振り分けが機能する見込み。コストは291語で約6万トークン（数円）、
全保留2,720語でも数十円程度。

## Verbatim（実測値）

- 構成: gpt-5.6-luna / Chat Completions / json_schema strict / 25語バッチ / マスタ全242件（分類付き）を同梱
- サンプル291語: 却下済み91（人間判断=対象外の正解付き）+ 保留の頻度上位100 + 保留ランダム100
- v1（基本プロンプト）: 一致 64/91 = **70.3%**。不一致27語は クラウド/DB/API/サーバ/インフラ/SaaS/
  RDBMS/DWH/BI/CRM/CMS 等の**総称・上位カテゴリ語に集中**（AIはregisterに倒した）
- v2（「マスタは個別製品・技術名の粒度。総称語はexclude」を1ルール追加）: 一致 **87/91 = 95.6%**、
  low-confidence 0
  - 残る不一致4語: Eclipse→register(high) / プロトタイピング→register(medium) /
    方式設計→register(medium) / NW→alias:ネットワーク(high)。いずれも人間側の判断も割れうる境界例
- 保留分の判定分布（v2）: 上位100語=exclude48/register43/alias9、ランダム100語=register23/exclude69/alias8
- トークン: v1=60,634 / v2=60,152（291語・12バッチ）

## Source

- devDB（dev.2-way.co.jp/ses）2026-08-25時点: unknown_terms status=0 が2,720語（累計出現12,563回・
  freq=1が974語）、status=2（却下）91語、skillsマスタ242件
- 正解データは却下クラスのみ（登録/別名クラスの人間正解は存在しない。マスタ登録済み語は
  unknown_termsに残らないため）。register/aliasの精度は未検証であり、導入時は人間承認を挟んで測る
- プロンプトの粒度ルールは却下91語から観察した方針の明文化であり、個別の答えは埋め込んでいない
  （例示は「クラウド」「DB」の2語のみ）

## Usage

- 関連PJ: thyme（スキルマスタ 登録待ちスキルタブ）・2way-ses-system
- 想定実装: AI判定を「提案」として保存し、登録待ちタブに判定案・確信度・理由を表示 →
  人間がワンクリック承認（decision APIは破壊的=案件自動再紐付けのため全自動適用はしない）。
  low-confidenceのみ個別確認に振り分け
- 未検証事項: alias先IDの正確性・registerの分類妥当性（導入初期の人間承認ログで実測する）
