#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Phase1 マッチング・提案管理 シードSQL生成スクリプト

入力: luna(gpt-5.6-luna)によるメール抽出検証結果jsonl
      /home/hp/claude/temp/ses_mail_probe/out/verify_result_gpt-5_6-luna_v3c_min.jsonl
出力: /home/hp/claude/2way-ses-system/db/phase1_seed.sql

方針（人間指示より）:
  - projects: 抽出フィールドをそのままINSERT
  - skills: required/preferred_skills_text から技術語を抽出し頻度上位で正規マスタ化。
    表記ゆれは skill_aliases に。凝った正規化は不要、機械的でよい
  - project_skills: 案件とスキルの紐付け
  - personnel: ダミー社員/BPを10名程度（マッチング動作確認用）

抽出方式:
  IT技術語の候補辞書（言語/FW/DB/OS/インフラ/ツール/役割語）を用意し、
  required/preferred_skills_text 全文に対して大小文字・全半角を無視した部分一致で走査する。
  マッチした「実際の表記」を skill_aliases の候補として記録し、辞書の正規名と異なる場合のみ
  エイリアスとして登録する（表記ゆれ吸収）。
  辞書に無いが頻出する語は unknown_terms に集計するのみ（Phase1は画面なし・内部蓄積）。
"""
import json
import random
import re
import unicodedata
from collections import Counter, defaultdict
from pathlib import Path

INPUT_PATH = Path("/home/hp/claude/temp/ses_mail_probe/out/verify_result_gpt-5_6-luna_v3c_min.jsonl")
OUTPUT_PATH = Path("/home/hp/claude/2way-ses-system/db/phase1_seed.sql")

random.seed(20260807)

# ----------------------------------------------------------------------------
# スキル辞書（canonical_name, category）
# category: 0:言語/1:FW/2:DB/3:OS/4:インフラ/5:ツール/6:その他
# ----------------------------------------------------------------------------
SKILL_DICT = [
    # 言語
    ("Java", 0), ("Python", 0), ("JavaScript", 0), ("TypeScript", 0), ("PHP", 0),
    ("Ruby", 0), ("Go", 0), ("C#", 0), ("C++", 0), ("C言語", 0), ("Kotlin", 0),
    ("Swift", 0), ("Scala", 0), ("COBOL", 0), ("VBA", 0), ("VB.NET", 0), ("ABAP", 0),
    ("PL/SQL", 0), ("Perl", 0), ("Objective-C", 0), ("HTML", 0), ("CSS", 0),
    ("SQL", 0), ("Shell", 0), ("PowerShell", 0), ("R言語", 0), ("Dart", 0),
    # FW/ライブラリ
    ("Spring Boot", 1), ("Spring", 1), ("React", 1), ("Vue.js", 1), ("Angular", 1),
    ("Node.js", 1), ("Laravel", 1), ("Django", 1), ("Ruby on Rails", 1), (".NET", 1),
    ("jQuery", 1), ("Struts", 1), ("Hibernate", 1), ("MyBatis", 1), ("Next.js", 1),
    ("Nuxt.js", 1), ("Flutter", 1), ("React Native", 1), ("Unity", 1), ("FastAPI", 1),
    ("Flask", 1), ("Bootstrap", 1),
    # DB
    ("MySQL", 2), ("PostgreSQL", 2), ("Oracle", 2), ("SQL Server", 2), ("MongoDB", 2),
    ("Redis", 2), ("DB2", 2), ("SQLite", 2), ("Elasticsearch", 2), ("DynamoDB", 2),
    ("Snowflake", 2), ("BigQuery", 2), ("MariaDB", 2),
    # OS
    ("Windows Server", 3), ("Windows", 3), ("Linux", 3), ("Unix", 3), ("CentOS", 3),
    ("RedHat", 3), ("Ubuntu", 3), ("iOS", 3), ("Android", 3),
    # インフラ/クラウド
    ("AWS", 4), ("Azure", 4), ("GCP", 4), ("Google Cloud", 4), ("Docker", 4),
    ("Kubernetes", 4), ("Terraform", 4), ("Ansible", 4), ("VMware", 4), ("Cisco", 4),
    ("ネットワーク構築", 4), ("サーバー構築", 4), ("インフラ構築", 4), ("負荷分散", 4),
    # ツール
    ("Git", 5), ("GitHub", 5), ("GitLab", 5), ("Jenkins", 5), ("JIRA", 5),
    ("Redmine", 5), ("Backlog", 5), ("Excel", 5), ("Tableau", 5), ("Power BI", 5),
    ("Salesforce", 5), ("SAP", 5), ("Photoshop", 5), ("Figma", 5), ("ChatGPT", 5),
    ("GitHub Copilot", 5), ("生成AI", 5), ("Slack", 5), ("Teams", 5),
    # 役割/工程（その他）
    ("PM", 6), ("PL", 6), ("PMO", 6), ("SE", 6), ("ブリッジSE", 6),
    ("インフラエンジニア", 6), ("要件定義", 6), ("基本設計", 6), ("詳細設計", 6),
    ("運用保守", 6), ("テスト", 6), ("製造", 6), ("機械学習", 6), ("AI開発", 6),
    ("プロジェクトリーダー", 6), ("プロジェクトマネージャー", 6),
]

REMOTE_TYPE_MAP = {
    "full_remote": 0,
    "fully_remote": 0,
    "remote": 0,
    "hybrid": 1,
    "partial_remote": 1,
    "onsite": 2,
    "on_site": 2,
    "unknown": 3,
    None: 3,
}


def normalize(text: str) -> str:
    """大小文字・全半角を無視した比較用に正規化"""
    if not text:
        return ""
    return unicodedata.normalize("NFKC", text).lower()


def sql_str(value):
    if value is None:
        return "NULL"
    text = str(value).replace("\\", "\\\\").replace("'", "\\'")
    return f"'{text}'"


def sql_int(value):
    if value is None:
        return "NULL"
    try:
        return str(int(value))
    except (TypeError, ValueError):
        return "NULL"


def sql_json(obj):
    return sql_str(json.dumps(obj, ensure_ascii=False))


def normalize_ym(value):
    """luna抽出の start_ym は 'yyyy-mm' 形式。DBの date型(日は01固定)に合わせて '-01' を補う"""
    if not value:
        return None
    value = str(value).strip()
    if re.fullmatch(r"\d{4}-\d{2}", value):
        return f"{value}-01"
    if re.fullmatch(r"\d{4}-\d{2}-\d{2}", value):
        return value
    return None


def extract_matches(text: str, dict_norm_index):
    """テキストからスキル辞書に一致する (canonical, matched_surface) の一覧を返す"""
    if not text:
        return []
    norm_text = normalize(text)
    hits = []
    for canonical, norm_name in dict_norm_index:
        if norm_name and norm_name in norm_text:
            hits.append(canonical)
    return hits


TOKEN_SPLIT_RE = re.compile(r"[、,，/／\n・\s()（）【】:：\-—・…]+")
STOPWORDS = {"", "の", "こと", "など", "経験", "実務", "以上", "程度", "必須", "歓迎",
             "スキル", "業務", "対応", "可能", "利用", "使用", "開発", "設計", "構築"}


def collect_unknown_terms(texts, matched_canonicals_set, dict_norm_set):
    counter = Counter()
    for text in texts:
        if not text:
            continue
        for raw_token in TOKEN_SPLIT_RE.split(text):
            token = raw_token.strip()
            if len(token) < 2 or len(token) > 20:
                continue
            if token in STOPWORDS:
                continue
            norm_token = normalize(token)
            if any(norm_token == d or norm_token in d or d in norm_token for d in dict_norm_set):
                continue
            if re.fullmatch(r"[ぁ-んァ-ヶ一-龠ー]+", token) and len(token) <= 3:
                # 短い日本語一般語はノイズになりやすいため除外
                continue
            counter[token] += 1
    return counter


def main():
    dict_norm_index = [(canonical, normalize(canonical)) for canonical, _ in SKILL_DICT]
    dict_norm_set = {n for _, n in dict_norm_index}
    category_by_name = {canonical: cat for canonical, cat in SKILL_DICT}

    projects = []
    with INPUT_PATH.open(encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            record = json.loads(line)
            for proj in (record.get("result", {}).get("projects") or []):
                projects.append(proj)

    print(f"[gen_seed] loaded projects: {len(projects)}")

    # --- スキル出現頻度集計（required + preferred の両方） ---
    skill_freq = Counter()
    alias_surface = defaultdict(set)  # canonical -> {実際の表記(辞書名と異なるもの)}
    project_required_hits = []  # [(project_index, [canonical,...])]
    project_preferred_hits = []

    all_texts_for_unknown = []

    for proj in projects:
        req_text = proj.get("required_skills_text") or ""
        pref_text = proj.get("preferred_skills_text") or ""
        all_texts_for_unknown.append(req_text)
        all_texts_for_unknown.append(pref_text)

        req_hits = extract_matches(req_text, dict_norm_index)
        pref_hits = extract_matches(pref_text, dict_norm_index)
        for c in req_hits:
            skill_freq[c] += 1
        for c in pref_hits:
            skill_freq[c] += 1
        project_required_hits.append(sorted(set(req_hits)))
        project_preferred_hits.append(sorted(set(pref_hits)))

    # 頻度0（=どの案件でも出現しなかった辞書語）は skills マスタに入れない
    used_skills = [name for name, _ in SKILL_DICT if skill_freq[name] > 0]
    # 頻度上位で200語以内に収める（辞書自体が150語弱のため通常は収まる）
    used_skills = sorted(used_skills, key=lambda n: (-skill_freq[n], n))[:200]
    used_skill_set = set(used_skills)

    print(f"[gen_seed] skills matched (freq>0): {len(used_skills)} / dict size {len(SKILL_DICT)}")

    # --- unknown_terms（辞書に無い頻出語） ---
    unknown_counter = collect_unknown_terms(all_texts_for_unknown, used_skill_set, dict_norm_set)
    unknown_top = [(term, freq) for term, freq in unknown_counter.most_common(50) if freq >= 2]
    print(f"[gen_seed] unknown_terms candidates (freq>=2): {len(unknown_top)}")

    # --- personnel ダミーデータ（10名） ---
    stations = ["東京", "新宿", "渋谷", "池袋", "横浜", "大宮", "川崎", "三軒茶屋", "本町", "梅田"]
    personnel_names_employee = ["山田太郎", "佐藤健一", "鈴木一郎", "高橋花子", "田中次郎", "伊藤美咲"]
    personnel_names_bp = ["渡辺勇気", "中村敦", "小林蓮", "加藤陽菜"]
    partner_companies = ["株式会社アルファテック", "ベータソリューションズ株式会社", "ガンマシステムズ株式会社"]

    top_skills_for_personnel = sorted(used_skills, key=lambda n: -skill_freq[n])[:40] or used_skills
    if not top_skills_for_personnel:
        top_skills_for_personnel = [name for name, _ in SKILL_DICT[:20]]

    personnel_rows = []
    personnel_skill_rows = []  # (personnel_index(1-origin), skill_name, years)
    for i, name in enumerate(personnel_names_employee, start=1):
        status = random.choice([0, 0, 1, 2])
        available_from = None if status == 0 else "2026-10-01"
        personnel_rows.append({
            "type": 0,
            "name": name,
            "status": status,
            "available_from": available_from,
            "station": random.choice(stations),
            "partner_company": None,
            "price_min": random.choice([550000, 600000, 650000, 700000]),
            "price_max": random.choice([750000, 800000, 850000, 900000]),
            "memo": "",
        })
        skills = random.sample(top_skills_for_personnel, k=min(4, len(top_skills_for_personnel)))
        for s in skills:
            personnel_skill_rows.append((len(personnel_rows), s, random.randint(1, 10)))

    for i, name in enumerate(personnel_names_bp, start=1):
        status = random.choice([0, 0, 1])
        available_from = None if status == 0 else "2026-09-01"
        personnel_rows.append({
            "type": 1,
            "name": name,
            "status": status,
            "available_from": available_from,
            "station": random.choice(stations),
            "partner_company": random.choice(partner_companies),
            "price_min": random.choice([600000, 650000, 700000]),
            "price_max": random.choice([800000, 850000, 900000, 950000]),
            "memo": "",
        })
        skills = random.sample(top_skills_for_personnel, k=min(5, len(top_skills_for_personnel)))
        for s in skills:
            personnel_skill_rows.append((len(personnel_rows), s, random.randint(1, 8)))

    print(f"[gen_seed] personnel: {len(personnel_rows)}, personnel_skills: {len(personnel_skill_rows)}")

    # ------------------------------------------------------------------
    # SQL 出力
    # ------------------------------------------------------------------
    out = []
    out.append("-- ----------------------------------------------------------------------------")
    out.append("-- SES補助システム マッチング・提案管理 Phase 1 シードデータ")
    out.append("--")
    out.append("-- 生成元 : temp/ses_mail_probe/out/verify_result_gpt-5_6-luna_v3c_min.jsonl (luna抽出 225案件)")
    out.append("-- 生成方法: db/tools/gen_seed.py（機械的なキーワード一致による抽出。凝った正規化は行わない）")
    out.append("-- 対象  : skills / skill_aliases / unknown_terms / projects / project_skills / personnel / personnel_skills")
    out.append("-- 注意  : proposals はシード対象外（動作確認は空の状態から画面/APIで作成する想定）")
    out.append("-- ----------------------------------------------------------------------------")
    out.append("")
    out.append("SET NAMES utf8mb4;")
    out.append("")

    # skills
    out.append("-- ----------------------------------------------------------------------------")
    out.append(f"-- skills ({len(used_skills)}件)")
    out.append("-- ----------------------------------------------------------------------------")
    for name in used_skills:
        cat = category_by_name[name]
        out.append(
            f"INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES "
            f"({sql_str(name)}, {sql_int(cat)});"
        )
    out.append("")

    # skill_aliases（大文字/小文字/全半角ゆれの代表例を機械的に生成）
    out.append("-- ----------------------------------------------------------------------------")
    out.append("-- skill_aliases（表記ゆれ:大文字/全角/スペース除去バリエーションを機械生成）")
    out.append("-- ----------------------------------------------------------------------------")
    alias_seen = set()
    alias_count = 0
    for name in used_skills:
        candidates = set()
        candidates.add(name.upper())
        candidates.add(name.lower())
        candidates.add(name.replace(" ", ""))
        candidates.add(unicodedata.normalize("NFKC", name))
        candidates.discard(name)
        for alias in sorted(candidates):
            if not alias or alias == name:
                continue
            key = normalize(alias)
            if key == normalize(name):
                continue
            if key in alias_seen:
                continue
            alias_seen.add(key)
            out.append(
                f"INSERT INTO `ses`.`skill_aliases` (`skill_id`, `alias_text`) VALUES "
                f"((SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = {sql_str(name)}), {sql_str(alias)});"
            )
            alias_count += 1
    print(f"[gen_seed] skill_aliases: {alias_count}")
    out.append("")

    # unknown_terms
    out.append("-- ----------------------------------------------------------------------------")
    out.append(f"-- unknown_terms（マスタ未登録の頻出語, freq>=2 のみ, {len(unknown_top)}件）")
    out.append("-- ----------------------------------------------------------------------------")
    for term, freq in unknown_top:
        out.append(
            f"INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES "
            f"({sql_str(term)}, {sql_int(freq)}, 0);"
        )
    out.append("")

    # projects
    out.append("-- ----------------------------------------------------------------------------")
    out.append(f"-- projects ({len(projects)}件)")
    out.append("-- ----------------------------------------------------------------------------")
    for idx, proj in enumerate(projects, start=1):
        remote_raw = proj.get("remote_type")
        remote_code = REMOTE_TYPE_MAP.get(remote_raw, 3)
        start_ym = normalize_ym(proj.get("start_ym"))
        out.append(
            "INSERT INTO `ses`.`projects` "
            "(`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, "
            "`unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, "
            "`interview_count`, `status`) VALUES ("
            f"{sql_str(proj.get('title'))}, {sql_str(proj.get('description'))}, "
            f"{sql_str(proj.get('required_skills_text'))}, {sql_str(proj.get('preferred_skills_text'))}, "
            f"{sql_str(proj.get('price_text'))}, {sql_int(proj.get('unit_price_min'))}, "
            f"{sql_int(proj.get('unit_price_max'))}, {sql_str(proj.get('location'))}, "
            f"{sql_int(remote_code)}, {sql_str(proj.get('start_text'))}, {sql_str(start_ym)}, "
            f"{sql_int(proj.get('interview_count'))}, 0);"
        )
    out.append("")

    # project_skills（1-origin の連番でINSERT順=project_idと仮定。auto_incrementが1開始である前提）
    out.append("-- ----------------------------------------------------------------------------")
    out.append("-- project_skills（required_skills_text由来=必須, preferred_skills_text由来=歓迎）")
    out.append("-- 注意: project_id は本ファイルを空のprojectsテーブルに対して実行する前提の連番参照")
    out.append("-- ----------------------------------------------------------------------------")
    ps_count = 0
    for idx, (req_hits, pref_hits) in enumerate(zip(project_required_hits, project_preferred_hits), start=1):
        for name in req_hits:
            out.append(
                f"INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES "
                f"({idx}, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = {sql_str(name)}), 1);"
            )
            ps_count += 1
        for name in pref_hits:
            if name in req_hits:
                continue
            out.append(
                f"INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES "
                f"({idx}, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = {sql_str(name)}), 0);"
            )
            ps_count += 1
    print(f"[gen_seed] project_skills: {ps_count}")
    out.append("")

    # personnel
    out.append("-- ----------------------------------------------------------------------------")
    out.append(f"-- personnel（ダミー社員/管理BP, {len(personnel_rows)}名。マッチング動作確認用）")
    out.append("-- ----------------------------------------------------------------------------")
    for p in personnel_rows:
        out.append(
            "INSERT INTO `ses`.`personnel` "
            "(`personnel_type`, `name`, `status`, `available_from`, `nearest_station`, `partner_company`, "
            "`desired_unit_price_min`, `desired_unit_price_max`, `memo`) VALUES ("
            f"{sql_int(p['type'])}, {sql_str(p['name'])}, {sql_int(p['status'])}, "
            f"{sql_str(p['available_from'])}, {sql_str(p['station'])}, {sql_str(p['partner_company'])}, "
            f"{sql_int(p['price_min'])}, {sql_int(p['price_max'])}, {sql_str(p['memo'])});"
        )
    out.append("")

    out.append("-- ----------------------------------------------------------------------------")
    out.append(f"-- personnel_skills（{len(personnel_skill_rows)}件）")
    out.append("-- 注意: personnel_id は本ファイルを空のpersonnelテーブルに対して実行する前提の連番参照")
    out.append("-- ----------------------------------------------------------------------------")
    for personnel_idx, skill_name, years in personnel_skill_rows:
        out.append(
            f"INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES "
            f"({personnel_idx}, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = {sql_str(skill_name)}), {sql_int(years)});"
        )
    out.append("")

    OUTPUT_PATH.write_text("\n".join(out) + "\n", encoding="utf-8")
    print(f"[gen_seed] wrote {OUTPUT_PATH} ({len(out)} lines)")


if __name__ == "__main__":
    main()
