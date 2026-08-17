-- ----------------------------------------------------------------------------
-- SES補助システム マッチング・提案管理 Phase 1 シードデータ
--
-- 生成元 : temp/ses_mail_probe/out/verify_result_gpt-5_6-luna_v3c_min.jsonl (luna抽出 225案件)
-- 生成方法: db/tools/gen_seed.py（機械的なキーワード一致による抽出。凝った正規化は行わない）
-- 対象  : skills / skill_aliases / unknown_terms / projects / project_skills / personnel / personnel_skills
-- 注意  : proposals はシード対象外（動作確認は空の状態から画面/APIで作成する想定）
-- ----------------------------------------------------------------------------

SET NAMES utf8mb4;

-- ----------------------------------------------------------------------------
-- skills (89件)
-- ----------------------------------------------------------------------------
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Java', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('基本設計', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('SQL', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('テスト', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('要件定義', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('SE', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('C#', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('PL', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('AWS', 4);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('PM', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('詳細設計', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Linux', 3);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('.NET', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Oracle', 2);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Azure', 4);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('JavaScript', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Spring', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Windows', 3);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Excel', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Python', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('React', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('VB.NET', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Git', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('PMO', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('運用保守', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Laravel', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('生成AI', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('COBOL', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('PHP', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Shell', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('製造', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Docker', 4);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('PL/SQL', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('PostgreSQL', 2);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Angular', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Cisco', 4);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Kubernetes', 4);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('TypeScript', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('VMware', 4);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('GitHub', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('SQL Server', 2);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('VBA', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('iOS', 3);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Flutter', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('GCP', 4);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Go', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('AI開発', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Android', 3);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('C++', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Spring Boot', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('プロジェクトリーダー', 6);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('GitLab', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('HTML', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('MySQL', 2);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('PowerShell', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Terraform', 4);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Windows Server', 3);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('BigQuery', 2);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('CSS', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('GitHub Copilot', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('JIRA', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Next.js', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Node.js', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Power BI', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Ruby', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Ruby on Rails', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Salesforce', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Struts', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Vue.js', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('ネットワーク構築', 4);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Ansible', 4);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Backlog', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('C言語', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('DB2', 2);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('DynamoDB', 2);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('FastAPI', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Jenkins', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Kotlin', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('MongoDB', 2);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('MyBatis', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Perl', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Redis', 2);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Redmine', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Snowflake', 2);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Swift', 0);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Tableau', 5);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Unity', 1);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('Unix', 3);
INSERT INTO `ses`.`skills` (`canonical_name`, `category`) VALUES ('サーバー構築', 4);

-- ----------------------------------------------------------------------------
-- skill_aliases（表記ゆれ:大文字/全角/スペース除去バリエーションを機械生成）
-- ----------------------------------------------------------------------------
INSERT INTO `ses`.`skill_aliases` (`skill_id`, `alias_text`) VALUES ((SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL Server'), 'SQLServer');
INSERT INTO `ses`.`skill_aliases` (`skill_id`, `alias_text`) VALUES ((SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring Boot'), 'SpringBoot');
INSERT INTO `ses`.`skill_aliases` (`skill_id`, `alias_text`) VALUES ((SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows Server'), 'WindowsServer');
INSERT INTO `ses`.`skill_aliases` (`skill_id`, `alias_text`) VALUES ((SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitHub Copilot'), 'GitHubCopilot');
INSERT INTO `ses`.`skill_aliases` (`skill_id`, `alias_text`) VALUES ((SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Power BI'), 'PowerBI');
INSERT INTO `ses`.`skill_aliases` (`skill_id`, `alias_text`) VALUES ((SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Ruby on Rails'), 'RubyonRails');

-- ----------------------------------------------------------------------------
-- unknown_terms（マスタ未登録の頻出語, freq>=2 のみ, 50件）
-- ----------------------------------------------------------------------------
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('運用経験', 19, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('構築経験', 18, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('開発経験', 13, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('Microsoft', 13, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('3年以上', 12, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('コミュニケーション能力', 11, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('の実務経験', 8, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('実務経験', 8, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('Claude', 8, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('保守経験', 7, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('5年以上', 7, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('での開発経験', 6, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('DNS', 6, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('Apache', 6, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('円滑なコミュニケーション能力', 5, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('コミュニケーション力', 5, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('2年以上', 5, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('顧客折衝経験', 5, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('コードレビューの経験', 5, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('Web', 5, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('JP1', 5, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('L2', 5, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('ロードマップ策定経験', 5, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('Word', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('リーダー経験', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('SMTP', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('進捗管理', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('での開発経験がある方。', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('いずれかのご経験がある方。', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('Active', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('Data', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('③年齢', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('2名', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('ビジネスレベル', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('セキュリティ戦略', 4, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('としての実務経験', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('上流工程', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('CMSの導入', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('カスタマイズの実務経験', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('※実際の経験が無くても', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('他で補えるスキル', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('経験があれば相談可', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('Drupal', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('HubSpot', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('性能対策', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('セキュリティ対策', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('および評価の経験', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('の実装経験', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('システム開発歴', 3, 0);
INSERT INTO `ses`.`unknown_terms` (`term`, `freq`, `status`) VALUES ('DBに関する知識', 3, 0);

-- ----------------------------------------------------------------------------
-- projects (225件)
-- ----------------------------------------------------------------------------
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('電動車椅子の販売管理システム', 'Git Hub Copilotを利用したaI駆動 (Poc)', 'Git Hub Copilotを利用した製造方針の立案、開発経験
(mdファイル、プロンプト等を利用したAI開発駆動設計の経験)', '予定工数・実績工数からPRJの進捗をはかる経験', 'スキル見合い（清算条件 140h-180h）', NULL, NULL, '鶴舞線 赤池からバス10分程', 0, '〜2026年11月末 ※以降、別案件へのスライドの可能性あり。', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('メーカー様向けシステム開発', NULL, 'PLCの実務経験', NULL, '42万～47万円程度（140-180）', 42, 47, '本町', 3, '即～中長期', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('CMS導入・カスタマイズPJにおけるPL募集', '既存の独自CMS（Java＋Oracle）を「Drupal」へリプレースするプロジェクト。パッケージ導入・カスタマイズに加え、HubSpotをはじめとする他システムとのAPI連携等も行う。プロジェクトを牽引し、PL業務全般を専任で担当する。', 'プロジェクトリーダー（PL）としての実務経験（3年以上）
Java および Oracle での開発経験
上流工程（基本設計・詳細設計）の実務経験（3年以上）
AWS環境でのサービス構築経験
運用保守の設計経験
CMSの導入・カスタマイズの実務経験（※実際の経験が無くても、他で補えるスキル・経験があれば相談可）', 'Drupal または HubSpot の実務経験
性能対策、セキュリティ対策、および評価の経験
CMSを用いたシステムの運用保守経験', '85万円程度', NULL, NULL, '大手町', 0, '8月〜　※前倒し検討可', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('販売管理システム開発支援作業（上位増員枠）', NULL, 'VB.net　経験豊富な方、（oracle、 PL/SQL）
販売管理システム開発経験
コミュニケーション能力が高い方', 'C#できればなおよし', 'スキル見合い', NULL, NULL, '日本橋、なんば周辺（常駐）', 2, '随時~長期', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('情報提供基盤案件', NULL, 'SQLserverに熟知している人、チューニング経験', 'java,springboot', 'スキル見合い(140-180h)', NULL, NULL, '久宝寺(max週2在宅可) ※肥後橋でも相談可能', 1, '8月～一旦3カ月', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Codex / 業務改善・可視化・自動化 / PMO', '中央省庁向け大規模システム開発プロジェクトにおいて、提案・事業管理業務の高度化を支援いただく案件です。見積・数値管理の属人化解消に向け、生成AI（Codex等）や各種ツールを活用した業務の可視化・標準化・自動化を推進し、設計内容の現場への落とし込みから運用定着までご担当いただきます。', '・Codex（AIエージェント）を活用した業務自動化・効率化のイメージをお持ちの方
・Excel等を用いた数値・データの構造化が可能な方', '・業務プロセスの整理・標準化の経験
・事業管理・数値計画・PMO・コンサルティングの実務経験', '～90万円', NULL, 90, '初台', 1, '2026年8月～2026年10月末（継続前提）', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('情シス作業要員募集', 'iPhone・iPad・PC・その他周辺機器・ソフトウェアの調達、IT関連のヘルプデスク、バックオフィス業務、マニュアル作成作業', '清潔感あり、コミュ力あり（落ち着きがあって会話が弾む社交性のある方）
マニュアル作成のため、日本語文書力がある
事務作業経験（２年程度１人称）
ＰＣに関連する事務（発送、請求、資産登録等）
EXCEL資料作成（Vlookupは必須）※調べながらはＮＧ
iphone（IOS）操作経験　※業務以外・個人使用でも可
Apple製品ユーザーであり、基本的な操作や単語に問題がないこと
iPhone/iPadとアプリケーションの互換性など検証を行うことが苦ではないこと
事務経験があること
Microsoft Word、Microsoft Excel、Microsoft PowerPointの使用に問題がないこと
（Excel関数を自分で組め、他者の作成した関数も問題なく使用・修正できること）
常識的なビジネスマナー（会社での立ち振る舞い・電話応対・メール対応）が身についていること
職員から来たメールを読み解き、適切な回答を作成することができること
日本語マニュアルや文章を読み、内容を理解することができること
スケジュールを意識し、作業の優先順位を自身で組めること
マルチタスクが可能であること
体調不良による突発のお休みが年間3日以内であること。遅刻や早退がないこと', NULL, 'スキル見合い 〜35万まで（140-180）', NULL, 35, '飯田橋', 2, '8月〜', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手キャリア向けAIエージェントアプリ開発', 'AIエージェントを搭載したAndroid/iOS向けアプリ開発案件。Flutterを用いたモバイルアプリ開発をご担当いただきます。', 'Flutterを用いたAndroid/iOSアプリ開発経験
円滑なコミュニケーション能力', NULL, '55万前後（スキル見合い）', NULL, NULL, 'フルリモート（地方可）', 0, '2026年7月16日～　※継続の可能性あり', '2026-07-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('M365構築導入案件', 'M365の構築から導入までの調査・設計・検証・構築・運用保守', 'Microsoft 365サービスの構築・保守経験
Microsoft Entraの構築・保守経験
BAT、PowerShellに関する知識', NULL, 'スキル見合い　140-200', NULL, NULL, '柏', 3, '即～長期予定', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('データ連携基盤開発支援', '新規導入されるSAP（債権債務業務）とデータ連携している周辺システムとのI/Fの作業支援。作業工程：影響調査、要件整理、設計（マッピング等）、開発（ワークフロー等）、テスト', 'オープン系での基本設計以降の経験。
SEとして積極的に課題解消できる方。', 'PowerCenter経験', NULL, NULL, NULL, '千里中央', 1, '2026年10月～中長期予定（四半期更新）', '2026-10-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('生産システム（図面システムとの連動あり）のリニューアル作業の設計', '現行システムの解析を行い機能の洗出し。操作性、視認性を重視し、GUIはゼロベースで再構築。作業工程：現行調査、設計（モック画面開発）', '基本設計の経験　※上流工程が豊富（5年以上）の方
コミュニケーション力（顧客との折衝もあります）
現行システム（C＃、WinForms）の調査分析経験
C＃、WinFormsでの開発経験（現行システムの解析＆モック作成）', NULL, 'スキル見合い（140〜180時間）', NULL, NULL, '梅田　※週１回程度、別の場所（大阪市内）で作業があります', 2, '7月（8月でも可）〜2027/3', '2026-07-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('教育業向け 基幹システム刷新（マイクロサービス開発）', '教育業界向け基幹システムの大規模刷新プロジェクトです。既存システムをマイクロサービスアーキテクチャへ刷新しており、各業務ドメインごとのサービス設計・開発をご担当いただきます。アーキテクチャ設計から開発までモダンな技術スタックを採用しており、バックエンド・フロントエンド双方に携われる環境です。', '・Java（Java17）を用いたWebシステム開発経験
・Spring Bootでの開発経験
・React（React18）＋TypeScriptでの画面開発経験
・REST API設計・開発経験
・PostgreSQLなどRDBMSの設計・SQL開発経験
・Gitを利用したチーム開発経験
・Dockerを利用した開発経験
・OpenAPI（Swagger）を利用したAPI開発経験
・GitHub Actions等を利用したCI/CD経験
・OAuth等のトークンベース認証の実装経験', '・マイクロサービスアーキテクチャでの開発経験
・DDDまたはクリーンアーキテクチャの知見
・AWS環境での開発経験（ECS、API Gateway、EventBridge、Step
Functions、S3、IAM、VPC、ALB、CloudWatch等）
・MyBatis・Gradle利用経験
・マイクロフロントエンド構成での開発経験
・SSO・証明書認証（OneGate等）の実装経験
・RBAC（ロールベースアクセス制御）の実装経験
・バッチ開発経験
・PDF・Excel・CSV等の帳票生成経験
・SFTP等の外部システム連携経験
・API・バッチの性能改善・チューニング経験
・技術選定や設計レビューなどリード経験', '〜85万円（スキルによって上振れ可能）', NULL, 85, '九段下', 1, '即日～長期予定', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('システム機能追加・改修', 'システム機能追加・改修', 'WEB開発、Java、PL/SQL
コミュニケーションが良好な方', NULL, 'スキル見合い（140-180h）', NULL, NULL, '灘駅or岩屋駅', 1, '8月or9月～長期予定', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('ServiceNow開発フルリモート', '現在ServiceNowプロジェクトが5件前後走っており、ServiceNow経験のある人材を募集。面談の際にスキル確認を行い、マッチする案件をご相談させて頂きます。参考として、BPMプロジェクト、SOMプロジェクト、ITSM/ITAM関連（へルプデスク負荷軽減、ITSMによるワークフロー導入に向けたPoCサポート）、DaaS案件（翻訳作業およびインドチームとのブリッジ）、インテグレーションプロジェクトなど。', '・ServiceNowの経験
・システム開発歴　5年以上
・コミュニケーション力（顧客、PM、メンバー間と円滑に行えるか）
・自主的に問題を解決出来るか（サポートはありますが、まずは自身で解決の道を探れるか）', '・顧客と直接やりとりした経験
・要件定義、設計　経験
・JavaScript経験
・HTML、CS経験
・DBに関する知識、実務経験', 'スキル見合い', NULL, NULL, NULL, 0, '2026年8月 or 9月〜', NULL, NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('DB(SQL Server)チューニング', 'クライアントの基幹システムについてオンプレ⇒クラウド移行いたしました。
移行後もシステム利用はできておりますがデータ取得時間がかかる等、
SQL文等のチューニングが必要となります。
主にはSQL文の回収メインですが基盤の知識もあれば尚可となります。', 'SQL Serverに対する知識
動作軽減のためのSQL文チューニング経験
コミュニケーション力
勤怠問題ない方', '基盤の知識
Java開発経験', 'スキル見合い(140-180h)', NULL, NULL, '久宝寺', 1, '8月～10月', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('製造業向けパッケージ開発', '製造業向けパッケージ（生産管理システム）の顧客ごとに行うアドオン開発', 'C#での開発経験（5年目安）
※C#メインで他言語も経験している方でもOK
コミュニケーション力
積極的な取り組み姿勢
詳細設計経験', '20代中盤～30代中盤', '60万(スキル見合い)※相談可', 60, 60, '肥後橋(大阪)', 3, 'なる早', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('オープンシステム開発支援', '�オフコンのプログラムをJavaへ置き換える開発支援
�SPA（シングルページアプリケーション）開発支援', 'Java・SpringBoot・SQL・JavaScript（またはTypeScript）
生成AIの知識（現場経験や種類は問いません）', 'ストアドプロシージャ
Vue.JS・Angular・ReactいずれかFW', NULL, NULL, NULL, 'JR「品川」駅（出社多め）', 2, '8月-長期', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('新会社設立に伴うシステム対応', '既存システムの改修作業を実施していただきます。
※現在、対象範囲調整中の為、対応システムの詳細については別途。', '画面系開発が中心：Java、JSP（3年程度）
何某かのフレームワーク経験
一般的なコミュニケーション力、理解力', NULL, '600,000円／月※スキル見合い', 60, 60, '品川駅徒歩8分', 1, '2026/8～', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('基幹システム(営業情報、工事情報、調達情報等、会計連携)の再構築', '本番稼働後の仕様変更対応に伴う設計・開発およびテスト実施。Javaの製造。画面側はPrimeFacesを利用したXHTML、サーバ処理はJavaにて作成。連携バッチ処理はSpringBatchを用いたJavaプログラムと、DataSpiderにて作成。既存機能の改修の他に、新規画面やバッチの製造もあり基本設計から総合テストまで通しで実施。', '画面もしくはバッチの基本設計から製造、テストまで通しで作業ができる。
JavaのWebアプリもしくはバッチアプリ開発経験。（Java：2年以上　※C#でも検討可）
品質向上の観点から、丁寧に作業できる方。
⇒決まったルールに基づき作業し、不明点などは確認、相談できる方。
※製造(コーディング)スキルとして、一人称で作業が実行できる方。', 'Eclipseを利用した開発経験。（必須ではないがあることが望ましい。）', 'スキル見合い（〜MAX70万程度）', NULL, 70, '天神橋筋八丁目', 2, '2026年8月〜2027年3月', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('【基本リモート/都内出社あり＠都内】【リーダークラス】大型PJにおけるAP基盤開発（生成AI活用）エンジニア', '大型PJにおけるAP基盤開発（生成AI活用）', 'Java（Spring Boot、Spring Batch）を用いた開発経験
システムの要件定義・基本設計などの上流工程経験
設計から実装まで一貫して対応可能な方
チームリーダーまたはリーダーポジションでの開発経験
バッチ処理の設計およびレビュー経験', '業務要件と基盤要件を踏まえ、共通部品化などの課題を抽出し、方式設計へ落とし込めるスキル
アプリケーション共通部品の設計・開発経験
フロントエンド開発経験
生成AIを活用した開発プロジェクトへの参画経験、または生成AIに関する技術的知見', '60万～80万円※スキル見合い', 60, 80, '東京都/駅', 1, '7月 〜', '2026-07-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('保険会社向けマイグレーション', '調査・分析・要件定義', '要件定義以降の経験
PM経験
業界経験15年以上', NULL, '75万前後（スキル見合い）', NULL, NULL, '茅場町と笹塚（両方とも通勤範囲内で常駐できる方）', 2, '8月15日以降もしくは9月〜長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('飲料メーカー向け開発支援', '飲料メーカー様の情シス部門と連携しながら開発業務に従事していただきます。
開発環境：Java、Springboot、React', '【　】要件定義以降の経験
【　】開発経験7年以上
【　】Java(Springboot)開発経験
【　】React開発経験（※類似FWでも可）
【　】顧客折衝経験
【　】勤怠名、健康面、持病等が問題ない方', '【　】リーダー経験', 'スキル見合い（～90万）', NULL, 90, '田町', 1, '8月～長期', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手流通業向けAzure基盤設計・構築およびバックアップ・DR設計', 'グループ責任者の支援のもと、Azure基盤の設計・構築・運用を担当。大手流通業向けに、ランサムウェア被害を前提とした全社バックアップポリシーの策定・方式設計を進めるプロジェクト。', '【工程経験】
・基本設計、詳細設計、構築、テスト、本番移行までの一連の経験
・各工程における設計書、手順書などのドキュメント作成経験
・単体、結合、システムテストの計画・実施経験
・切替、リリース対応の実務経験
【技術スキル】
・Azure環境での設計・構築経験
　※AWS,GCPも可
・Windows Serverの設計・構築経験
【人物面】
・課題に対して主体的に動き、解決まで推進できる方
・関係者と円滑にコミュニケーションを取れる方
・新しい技術や領域に前向きに取り組める方', '・バックアップの設計または運用経験
・DR、RPO／RTO設計の経験
・ランサムウェア対策など、セキュリティ分野の知見
・リーダー、マネジメントまたはプレイングマネージャー経験', 'スキル・ご経験に応じて決定', NULL, NULL, '梅田または新大阪', 1, '2026年9月初旬または中旬予定', '2026-09-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('金融機関向け 基盤更改エンハンス対応', '基盤更改に伴う結合テスト、総合テスト（ST）・受入テストの対応
JavaおよびSQL Serverを用いた各種エンハンス対応・修正作業', 'Java開発経験
SQL ServerにおけるSQLの実務経験', NULL, '60万円', 60, 60, '大崎', 2, '即日〜2027年6月（予定）', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('クラサバ販売管理システムの改修', '基本設計、詳細設計、製造、テスト仕様設計、テスト実施', 'VB.NET、ORACLE、PLSQL', '旧グレープシティ製品の経験が有れば尚良し
(インプットマン、マルチロウ、アクティブレポート等）', 'スキル見合い', NULL, NULL, 'フルタニ産業　8階（最寄り駅：西大橋、四ツ橋）', 2, '2026年8月〜 2026年10月末', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('サーバー運用', '・各種サーバの状態監視と障害時の対応
・設定変更、パッチなどのメンテンス
・利用者の問い合わせ対応
・上記の業務実施上の手順作成、作業実施含む
・顧客との技術的な折衝', '・上記サーバを一部でも運用を行ったことがあること
・問い合わせ対応、問い合わせに関連した調査をしたことがある
・MAIL、DNS、WEB、DBサーバを立てて運用したことがある
・Linux に関する基礎知識（基礎コマンドを利用、検索して使用できる）
・ネットワークに関する基礎知識（IP アドレスとルーティング、DNSとの関係）
・スクリプト作成（bash または python など）
・業務上、資料作成が多いため、論理的な文章力および資料を視覚的に分かりやすく整理・表現できるスキルを有すること。', '・SMTPとその周辺の技術についての知識
・SMTP、SPF、DKIM、DMARC、SMTP-AUTH、SMTPS、STARTTLS などの知識
・POP、IMAPなどのクライアント知識
・TELNET による送受信操作の知識
・DNS、PROXY、NTP知識
・上記で上げた各種ソフトを運用するために必要な知識
・ソフトウェア内で稼働する DB の運用ができる人', 'スキル見合い（〜65万円程度）', NULL, 65, '池袋', 0, '8月〜', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手通信キャリア向け 次期マイページ開発支援（AIネイティブエンジニア／PM枠）', '大手通信キャリア系企業の次期マイページ開発プロジェクト。現チームのPM層が離任予定のため、後任ポジションとして募集。開発チームに参画し、Claude Codeを活用した実装業務を中心に、チーム管理や開発プロセスの仕組み化も担当。', 'PMもしくはPM同等の経験をした方（チーム管理・進捗管理・品質管理など）
Claude Codeを活用した開発経験
Claude Codeを用いた開発基盤や運用ルールを構築できる方
AIを前提とした開発プロセスを設計・推進できる方', 'PMまたはチームリーダー経験
AIコードレビュー基盤の導入経験
AI開発ツールをチームへ浸透させた経験
要件定義など上流工程の経験', 'スキル見合い（80〜85万円が理想ですが、上振れも相談可能です）', 80, 85, '渋谷', 1, '8月半ば〜もしくは9月〜', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('受発注システム開発向け Java SE/PG募集', '受発注システム開発。詳細設計～単体テスト（経験は基本設計からある方希望）', '基本設計からテスト経験（修正のみ経験の方不可）
ドキュメント作成能力はそれなりに求められます
Java
SQL（得意な方）', 'ASTERIA（あれば特に歓迎）
顧客との折衝経験
Intra-mart（あれば尚良し）
PowerPointを用いたドキュメント作成
プロジェクト管理スキル（スケジュール管理、タスク管理）', 'スキルのマッチング度合いによって、65万円まで。', NULL, 65, '西三荘/リモート(自宅のみ) ※立ち上がり数日は出社必須。現在は出社/リモートでリモート比率高めです。', 1, '2026年9月（前倒し参加不可）～2027年1月末', '2026-09-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Linuxバージョンアップおよびセキュリティ対策業務', '・公開サーバのOSサポート切れ（EOL）に伴う基盤刷新対応
・RHEL8.4からRHEL8.10へのバージョンアップ
・既存マスタOSと同等構成での新規マスタOS構築
・Trend Micro Deep Securityによる仮想パッチ導入
・既存マネージャを利用した仮想パッチ管理およびエージェント適用環境構築
・セキュリティ強化対応', '・RHELサーバ構築経験（インストール／初期設定／セキュリティ設定）
・主体的に情報収集・整理・推進ができるコミュニケーション力', '・SystemWalker系製品の経験
　（CentricManager、OperationManager、ServiceQualityCoordinator）
・Deep Security等の仮想パッチ導入または運用経験', '〜55万円（スキル見合い）', NULL, 55, '神田', 2, '2026年8月〜11月※延長の可能性あり', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('M365運用・ヘルプデスク支援業務', 'M365に関する問い合わせ対応（電話・Teams電話・チャット・メール等での初期設定、認証、エラー、MAM等の相談対応）
Formsでのサイト作成、SharePoint運用支援（利用状況確認・報告、容量調整等）
Power Platform（Power Apps / Power Automate）問い合わせ対応
Entra ID（旧Azure AD）登録設定・アカウント発行・利用者管理（人事システム連携確認、初期パスワード通知等）', 'M365の実務経験
Microsoft Formsでのサイト作成経験
PowerShellを用いた実務経験
SharePointの運用・設定経験
Power Apps / Power Automateの問い合わせ対応経験', '量子科学技術研究開発機構や官公庁・研究機関等での運用・ヘルプデスク経験
インフラパラメータシートの作成・更新経験
Azure AD（Entra ID）に関する経験または知見
一般的なインフラスキル（Server、ネットワーク等の基礎知識）', '80万円まで', NULL, 80, '稲毛（稲毛駅徒歩10分 / 国立研究開発法人量子科学技術研究開発機構）', 2, '即日 or 2026/08～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('AIデータセンター立ち上げ案件', 'AIデータセンター立ち上げ案件。ネットワーク、ストレージ、サーバー／インフラ・エンジニアを募集。', '高いインプット能力と自走力：8月すぐに台湾出張や公トレーニングへの参加が予定されています。最先端のハードウェア仕様を短期間で叩き込めるキャッチアップ能力が必須です。
英語に対する抵抗感がないこと：ベンダーのマニュアルはすべて英語ベースとなるため、ドキュメントが読めるレベルの英語力は最低限必要ですが、翻訳等できるので抵抗がなければ問題ありません。
未知の領域でも自発的かつ前向きにキャッチアップできること', '後進の育成・マネジメントへの関心', '100万　※スキル次第で上振れ可能', 100, 100, '全国各地常駐。8月は台湾で研修予定', 1, '8月～', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('半導体製造装置の開発', '半導体製造装置の開発。基本設計から担当。', 'C#での開発経験5年以上
コードレビューの経験
基本設計以降の経験
コミュニケーション能力が高く、フットワークが軽い方（能動的に動ける方）
長期参画可能な方
富山に出張対応可能な方', '制御系開発経験（尚可）
装置開発の経験（尚可）', '70万～75万', 70, 75, '鶴見小野駅。富山へ月1回程度の出張あり', 2, '8月～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('電子決裁システム次期開発（管理者：PMO/リーダーポジション）', '電子決裁システム次期開発におけるプロジェクト推進・統制を担う管理者ポジション。', 'Webシステム開発における実務経験（5年以上）
進捗管理・メンバ管理の経験
課題解決に主体的に動いた経験', 'PLまたはPMO経験
ASP.NET（C#）での開発経験
SQL Serverの使用経験
Web Form（ASP.NET）経験
SharePoint開発経験
トラブル案件の立て直し経験', '90万円前後　上振れご相談可', NULL, NULL, '分倍河原駅 徒歩3分', 2, '2026年8月～2026年12月', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('金融機関向けバージョンアップ支援作業', '金融機関向けバージョンアップ支援作業。Java VerUp対応。', 'JavaのVerup対応の経験がある方。
Verup対応案件で設計以降のご経験がある方。
Spring環境で開発経験がある方。
Java（Spring）での開発経験がある方。', 'アーキテクチャ設計、技術選定経験、非機能要件設計、共通基盤設計、いずれかのご経験がある方。', 'スキル①　70万～75万まで目安（精算有140-200h）
スキル②　85万まで目安（精算有140-200h）', NULL, NULL, '池袋', 2, '8月～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('通信会社向け解析・リリース支援作業', '通信会社向け解析・リリース支援作業。不具合調査・対応、リリース対応、維持保守。', 'Javaでの開発経験がある方。
他人が実装したプログラムの不具合を調査し問題解決を行った経験がある方。', 'リリース時の夜間シフト対応が可能な方を優先。', '70万まで目安（140-200ｈ）※スキル次第で多少のご相談可', NULL, 70, '品川シーサイド', 1, '8月～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('通信会社向け開発支援作業', '通信会社向け開発支援作業。先行開発（製造・テスト）。', 'Javaでの開発経験が4年以上あり、Springを使用した開発経験がある方。
基本設計以降のご経験がある方。
フロント画面からバックエンドまで開発経験がある方。', 'アーキテクト設計、先行開発 、AP基盤チーム、いずれかのご経験がある方。', '80万まで（精算有140-200h）', NULL, 80, '八丁堀（駅から徒歩7分程度）', 2, '8月～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('飲料メーカー向け開発支援', '飲料メーカー向け開発支援。情シス部門と連携しながら開発業務に従事。', '要件定義以降の経験
開発経験10年以上
Java(Springboot)開発経験
React開発経験　※類似FWでも可
顧客折衝経験', 'リーダー経験', '～100万（精算固定）', NULL, 100, '田町', 1, '8月～長期', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('通信会社向けバージョンアップ支援作業', '通信会社向けバージョンアップ支援作業。Java VerUp対応。', 'JavaのVerup対応の経験がある方。
Verup対応案件で設計以降のご経験がある方。
Spring環境で開発経験がある方。', 'Verupに伴うライブラリ検討経験がある方が望ましい。', '～75万まで目安（精算有140-200h）', NULL, 75, '横浜（初月は1～2週間の出社期間あり）', 1, '8月下旬or9月～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('官公庁向け設計開発支援作業', '官公庁向け設計開発支援作業。要件定義からリリースまで。', 'Java（Spring）での開発経験がある方。
要件定義または基本設計以降のご経験がある方。
AngularJSまたはその他Javascript系フレームワークでの開発経験がある方。
コードレビューのご経験がある方。', 'AWS環境のご経験があれば尚可。', '70万目安（精算有150-200ｈ）※スキル見合い', NULL, NULL, '田町', 1, '9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('インフラ構築支援作業', 'インフラ構築支援作業。基本設計から担当。', 'インフラ経験4年以上', 'VMware設計構築経験、基本設計または詳細設計～経験（尚可）', '70万まで（精算有150-200h）', NULL, 70, '田町。環境設定で1～2週間我孫子に行く可能性あり', 1, '8月～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('郵便業向けクラウド移行', 'オンプレミスからクラウド（OCI）への移行案件（リフト）。', 'クラウド設計構築経験者（経験8年以上目安）
要件定義以降の経験
オンプレミスからクラウドへの移行経験
ミドルウェア知見保有者　※全て満たさなくてもOK
Cluster Pro
JP1（ジョブ）
Trendmicro
Web（Apache)
NewRelic', 'OracleCloud構築経験', '～80万　※経験次第で上振れ検討可能', NULL, 80, '都内', 1, '8月中旬or9月～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('省庁向け基盤構築（クラウド）', '省庁向け基盤構築（クラウド）。Microsoft 365およびAVD導入後の改善要望に伴う基盤構築。', '基本設計以降の経験
Azure環境構築経験', 'Microsoft 365導入経験
Active Directory、EntraIDの構築経験
Box構築経験
セキュリティ製品、暗号化製品、鍵管理製品の導入・構築経験
地頭が良く学習意欲の高い方については、経験が一部不足していてもポテンシャルを考慮して選考可能です。', '70～75万円目安
ポテンシャル採用の場合：60～65万円', NULL, NULL, '西府 または 武蔵小杉', 2, '2026年8月～', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('某大手通信会社 請求書システム開発支援案件', '某大手通信会社向け請求書システムの開発支援。システム運用・サポートを中心に、顧客対応や各種調整業務を担当。', '24時間365日対応が可能な方
日常英会話が可能な方
PC操作に問題のない方
顧客折衝経験
事務経験
主体的に行動できる方', 'システム開発経験', '55～60万円目安　※システム開発経験者はスキル見合いで応相談', 55, 60, '品川シーサイド', 2, '即日／2026年8月～', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('既存システム改修・設計開発支援', '既存システム改修後、別業務で設計から担当する想定。', 'Java、C＃、Pythonなどオープン系開発経験3年以上(メインはJavaでの開発になります)
詳細設計以降一人称で対応出来る方
コミュニケーションスキルが高い方', '顧客折衝の経験があれば尚良し', '60～65万', 60, 65, '品川シーサイド（基本常駐）', 2, '8月', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('AI駆動開発を活かしたCOBOLシステムのモダナイゼーション', '生産管理系システムの近代化（モダナイゼーション）を、積極的なAI利活用のもと推進していただくポジションです。技術検証、設計、実装、試験工程を一貫してご担当いただきます。', 'COBOLから.NETへのモダナイゼーション実務経験
COBOLを用いたシステム開発経験（直近での実務経験必須）
.NET（VB.NET / C#）での開発経験
AI駆動開発の実務経験（ツール問わず）', NULL, 'スキル見合い（〜85万円：スキル・対応体制により相談可能）', NULL, 85, 'フルリモート（緊急時に大阪に出社対応が可能な方、関西在住のみ）', 0, '9月〜長期', '2026-09-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('NW構築および維持運用業務', 'お客様が展開しているサービスのNW環境の構築、運用業務（お客様が運用するデーターセンター作業が中心になります）', '主にCisco機器(L2/L3SW、FireWall等)設定および障害切り分け対応経験
LB（BIG-IP）構築経験
一から機器の設定を行ったことがある
障害切り分けは切り分けだけでなく一次、二次対応経験
主担当として動ける方
45歳以下であること', 'ToDo,課題管理の推進が得意な方を歓迎', 'スキル見合い ※Max：60万まで', NULL, 60, '新宿御苑', 1, '8・9月〜長期', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('商品マスターのメンテナンスシステム開発', '商品マスターのメンテナンスシステム開発', '要件定義〜設計〜製造〜テストの全行程が出来る方
AWSサービスを利用してアプリ開発が出来る方
C#.Net
AmazonAurora（PostgressSQL)
Angular 18.2、KendoUI 16.11（またはJavascript）', NULL, 'スキル見合い(140-180h)', NULL, NULL, '弊社内', 1, '8月から27年1月（以降継続の予定）', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('基幹システム保守開発案件', '生保会社の基幹システムの保守開発を担当。サブシステム(請求系)の保守開発か新規の保守チームにアサイン予定。弊社上位会社のリーダーの下部に増員メンバーとして参画想定。', 'COBOL開発経験(IBM尚可)
生保関連PJ参画経験', NULL, 'スキル見合い', NULL, NULL, '錦糸町(週1回程度の出社)', 1, '9月～長期', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('通販会社向け基幹システム刷新PJ支援（PM募集）', '通販会社向け基幹システム刷新PJにおいて、ユーザ側情報システム部門の立場で開発会社と社内調整を推進いただくポジションです。', '・高いコミュニケーションスキル
・PM/PMO経験
・通販系ECシステムに関する知見', '・マルチベンダーマネジメント能力
・基幹システム刷新の知見', 'スキル見合いにより要相談（130h-170h）', NULL, NULL, 'JR京都駅', 1, '2026年8月〜2027年2月
※2026年8月中旬以降の参画希望は応相談', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('重機メーカー向け　生成AI導入のリスクアセスメント支援', '重機メーカー向けに、生成AI／AIエージェントがサイバーセキュリティへ与える影響に関するリスクアセスメント支援を行う案件です。高性能生成AIやAIエージェントの活用が進む中で、脆弱性探索、攻撃自動化、情報漏えい、不正利用、ガードレール回避などの観点からリスクを整理し、評価・報告を実施いただきます。', '・情報セキュリティまたはサイバーセキュリティに関する知識
・セキュリティアセスメント、リスク評価、セキュリティコンサルティングの経験
・顧客向け資料作成経験
・PowerPointを用いたドキュメント作成スキル
・主体的にキャッチアップし、自走できるコミュニケーション能力', '・生成AI、LLM、AIエージェントに関する知見
・AIガバナンス、AIリスク管理に関する知見
・製造業または重工業向けプロジェクト経験
・OT（Operational Technology）／工場系セキュリティの知見
・生成AIに起因するサイバーリスク（脆弱性探索、攻撃自動化、情報漏えい等）の整理経験', '完全スキル見合い', NULL, NULL, '赤坂or大手町（週1~2出社予定）', 1, '2026年8月～', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Windowsサーバ基盤更改・クラウドリフト支援', 'VMWare上の既存Windowsサーバ群のAzure上へ移行
OS更改（Windows Server 2016 → 2022/2025）含む', 'サーバ設計
サーバ構築（バックアップ業務、監視業務）
※Azure、zbbix、JP1を使用', 'VMWareでのサーバ構築
クラウドでの監視構築経験
テストシナリオ作成
Veeamの知識', 'ご提示ください', NULL, NULL, '梅田またはリモート', 1, '2026年9月頃～11月頃（延長の可能性あり）', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('フルスタックアプリ開発案件', 'スマートフォン向けアプリケーションの開発業務をご担当いただきます。
Android・iOS・Webアプリを対象に、要件整理、基本設計・詳細設計、実装、テスト、リリース後の保守・運用まで、一連の工程に携わっていただきます。

フロントエンド・バックエンドを含めた幅広い開発領域に対応いただき、AIを活用した開発手法や各種開発支援ツールを取り入れながら、主体的に開発を推進できる方を求めています。', '・Kotlin、Swiftでの開発経験
・コミュニケーションが自発的に取れる方
・お客様との顧客折衝経験', '・Reactでの開発経験
・Node.jsでの開発経験
・モバイルアプリとWebアプリを用いた開発経験', 'スキル見合い（150-180h）', NULL, NULL, '神戸駅', 2, '7月～長期', '2026-07-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('《元請直案件》大規模会員管理システム拡張プロジェクト開発支援（Rubyエンジニア募集）', '新規プロダクトの立ち上げメンバーとして、物販・コンテンツ配信・リアルイベント連動・アンケート配信などのプロダクトをゼロから開発し、団体活動を一元的に支えるプラットフォームを構築します。既存の会員管理・決済機能を拡張し、団体の収益化・エンゲージメント向上・運営効率化までを包括的に支援する基盤プラットフォームとして設計・開発します。', '・Ruby on Railsの開発経験3年以上
・Web開発経験3年以上
・詳細設計経験フェーズ以降のご経験
・既存システムのコードを読み解き、改修・改善が行える方', '・基本設計から経験があると尚可
・要件定義や機能優先順位整理など、上流工程の経験
・顧客折衝やエンジニア以外のメンバーとの協働経験
・BtoB向け業務系Webサービスの開発経験', '65万　※スキルによっては上振れ可能性あり', NULL, 65, '代々木駅・新宿駅', 1, '即日 or 2026年6月〜', '2026-06-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('電力向け ADC／ロードバランサー導入およびネットワーク提案業務（SE・PM枠）', '顧客折衝を行い、どんなネットワークが必要かの要件整理/調整
Webサービスのアクセスを振り分け、安定稼働ができる仕組み（ロードバランサー、ADC）の導入方法を検討
障害が起きても影響が出にくい仕組みの設計提案（全体）
要件定義・基本設計など、設計中心の業務', '顧客折衝主体の案件参画経験
コアネットワーク構築（特に広域またはキャリア系）の要件定義と設計経験
コンサルまたはPMの経験', NULL, 'スキル見合い（単価や年齢問わず）', NULL, NULL, '梅田 or 在宅（キャッチアップ後にリモート併用想定）', 1, '即時', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('バックエンド・SRE案件', '建築DX向け既存Webアプリケーションの改修および品質管理をご担当いただきます。Python（FastAPI）を用いたバックエンド開発に加え、SRE領域でのインフラ運用・改善、CI/CD環境の整備、品質向上施策などをご担当いただく予定です。', 'Python（FastAPI）を用いたバックエンド開発経験
SRE経験
Terraform（IaC）
Docker
CI/CD
Kubernetes', 'SaaSプロダクトにおける品質管理・品質改善の経験', 'スキル見合い（60万前後想定）', NULL, NULL, 'フルリモート（地方からの参画可能）', 0, '開始時期調整中（3ヶ月更新予定）', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手SIer向け 公的機関システム更改 テスト推進支援', '国の年金業務システムにおける大規模更改プロジェクトにて、プロジェクト管理部門配下でのテスト推進業務をご担当いただきます。テスト環境（アプリケーション／ミドルウェア／アーキテクチャ／基盤）の横断的な管理・推進、テストリリースに伴う資材管理、リリース計画の推進、複数チーム間の課題整理・進捗管理・各種調整など、プロジェクト全体をリードしていただきます。', 'テスト推進業務の実務経験
関係者調整を含むプロジェクト推進経験
テスト環境（アプリ／ミドルウェア／アーキテクチャ／基盤）に関する幅広い知見
テストリリースおよび資材管理に関する知識・経験
過去の経験・知見を活かして主体的に課題解決・推進できる方
円滑なコミュニケーション能力', '構成管理に関する知識・経験
100名以上の大規模プロジェクト参画経験
IT全般に関する幅広い基礎知識
テスト統括・テストマネジメント経験', '〜90万円', NULL, 90, '初台', 1, '2026年10月〜長期', '2026-10-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('インフラ保守エンジニア（大阪）', '医療系業界の各種サーバーやネットワークの監視・運用・管理・保守業務
・VMware構成 の状態確認や保守
・Windows DHCP サーバの状態確認や保守
・ActiveDirectory / Domain Controller の状態確認や保守
※慣れたら電話対応〜障害対応まで一人称で実施いただきます。', '・ネットワークまたは、サーバの監視/保守/運用経験
・有線・無線ネットワーク（L2/L3、ルーティング、無線LAN、DNS/DHCP等）の知識および一次切り分け
・TCP/IPの理解
・24時間365日シフト可能な方', '・仮想化基盤の運用実務経験
・Cisco Catalyst Center運用経験
・セキュリティ知識、脆弱性管理', NULL, NULL, NULL, '大阪（梅田）', 2, '8月想定〜長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('生産管理システム開発支援', '工程：（詳細設計）、製造、テスト
人数：１名', '.NET全般、SQL', NULL, 'スキル見合い ご提示ください（140-180H）上下限割', NULL, NULL, '大阪市内（弊社顧客内）', 2, '９月〜長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手通信キャリア向けRCS検証・Change Management支援', '【RCS検証業務】
・RCS拡張機能試験業務
・コンテナ型仮想基盤移行に伴う検証業務
・UE操作
・ログ取得、解析
・試験結果報告
・試験進捗管理
【Change Management業務】
・リリースリクエスト作成および承認調整
・セキュリティ脆弱性チケット管理
・Change Request作成、承認対応
・夜間リリース対応
・機能要求、ビジネス要件の管理、追跡
・KPI作成およびプロダクション支援
・RCP移行プロジェクト支援
【障害管理業務】
・運用チーム、コアパフォーマンスチーム等への技術支援
・アップグレード、構成変更時の障害対応、調整
【ドキュメンテーション業務】
・HLD／LLD／CIQ等のドキュメント作成、管理
・ベンダーおよび関係各所との調整', '・英会話ビジネスレベル
・IPネットワークもしくはLinuxに関する基礎知識／実務経験
・案件が継続する限り長期参画可能な方
・勤怠が安定しており、体調面に不安がない方
・お客様、チームメンバーと円滑にコミュニケーションを取り能動的に業務を遂行できる方
・積極的に学ぶ姿勢がある方
・リーダーシップがあり、改善提案ができる方', '・日本語ビジネスレベル
・検証項目、検証手順書の作成経験
・Wiresharkを用いた通信試験経験
・SIP確認を含む検証経験
・モバイルネットワーク業務経験
・P-CSCF／I-CSCF／S-CSCF／HSS／EIR／MNP／HLR／SDLに関する実務経験', 'MAX40万円前後（スキル見合い）', NULL, 40, '二子玉川（常駐）
※業務都合により木場ラボへの出社あり', 2, '即日～長期
※2026年8月1日開始まで相談可能', NULL, NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('計画系システムの保守作業', '工場の生産計画システムの保守案件。既存アプリの機能改善、不具合対応、ユーザー問合せ対応を中心に設計・開発・テストを実施。', 'システム開発業務にて2～3年以上の経験者であること。
①Oracle：SQL（PL/SQL）開発経験者。
②Java,Struts,javaScriptを使用したWebアプリケーション開発経験者。
③Linuxでの作業経験（基本的なコマンド操作できる方）、
シェル開発経験等
④Excel：VBAの開発経験者', '責任感を持って能動的に業務に取り組める方。
上位メンバーと連携して顧客対応あり', '～62万円ほど(スキル見合い)', NULL, 62, '三重県四日市市（客先）→名古屋あたりからも通勤可能です！', 2, '2026年8月～9月～（長期）', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Live2Dを用いたキャラクター制作案件', 'エンジニアやLive2Dモデラーと連携しながら、キャラクターや衣装のデザイン、ラフから清書、そしてアニメーション用のパーツ分けまでを一貫してご担当いただきます。', 'ポートフォリオの提出
VTuber、もしくは類似したキャラクターのデザイン制作経験2年以上
Live2Dを用いたイラスト制作の実務経験
イラストのパーツ分けの経験', 'ソーシャルゲームでのデザイン制作経験', '1,500〜2,000円 / 時 ※時給制', NULL, NULL, NULL, 0, '即日 / 8月〜', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('二次元コンテンツを扱うサービスのバックエンド開発案件', '大手事業会社での各種開発や運用保守業務をお願いします。', 'アダルトコンテンツに抵抗のない方
PHP(Laravel)を用いたサーバーサイドの開発経験3年以上
ドメイン駆動設計(DDD)を用いた開発経験1年以上
数十万レコード以上のWebサービスの開発経験
テスト仕様書の作成およびテスト実施まで一貫した経験
JavaScriptを用いた開発経験
コードレビューの経験', 'パフォーマンスチューニングのご経験
イベントストーミングの実施経験', '100万前後まで ※スキル見合い', NULL, 100, '六本木一丁目', 1, '即日 / 8月〜', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('レンタル商社向けヘルプデスク案件', 'お客様からの問い合わせ対応、キッティング、アカウント管理等。かなり多い台数のキッティング作業が予定されています。', 'ヘルプデスク、キッティングのご経験
※無くてもPCについて詳しく、精通している方であれば検討可', '女性の方希望', '38万円（140-180H）', 38, 38, 'コスモスクエア（大阪）', 2, '8月 ～ 長期予定', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('AS/400保守開発案件', '複数のエンドユーザー向けシステムの保守・開発を担当頂く案件です。', 'AS/400 RPG
上流工程の経験　※コミュニケーション能力求められます', NULL, '50万程度（140-180h）', 50, 50, '肥後橋 or 新宿', 1, '8月～　※中長期想定', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('旅行会社向け 営業日報システムリニューアル開発', '旅行会社が利用する「営業日報システム」のリニューアルおよび保守業務
・アジャイル手法での設計、製造（コーディング）、テスト
・既存システムの調査や、リニューアルに伴う機能追加・改修', '・PHPおよびLaravel（または他MVCフレームワーク）を用いたシステム開発の実務経験（2年以上）
・Docker環境での開発経験
・SEPG枠：一人称での設計（基本設計・詳細設計）が可能なスキル
・PG枠：設計書を理解し、実装・単体テストを自走して進められるスキル', '・ユーザー対応や、エンドユーザーからのヒアリング・要件調整などの経験
・ウォーターフォールおよびアジャイル、両方の開発手法での参画経験
・Amazon ECSなど、AWS環境を用いた実務経験', '～55万円（スキル見合い）', NULL, 55, '西新宿', 1, '7月～長期', '2026-07-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手キャリア様向けAIエージェント搭載アプリ開発', '大手キャリア様向けのAIエージェントを搭載したアプリの開発です。「Flutter + AI駆動開発」でのAndroid/iOS向けのアプリを作成する形となります。', 'Flutterを使用したAndroid/iOS向けアプリ開発の経験。
プロジェクトメンバーとのコミュニケーションが十分にできること。', NULL, '50～55万前後', 50, 55, NULL, 0, '7/30 or 8/3～', '2026-07-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('調剤薬局向けクラウドシステム開発', 'オンプレにて動いていたものをクラウド移行実施（弊社体制にて4名参画中）', '・C#の開発経験（5年以上）
・Webアプリバックエンドの開発経験
・Azure上での開発経験', '・React開発経験
・調剤システム業務知見', 'スキル見合い', NULL, NULL, '新大阪駅', 2, '8月〜', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('JAVAを主力としたECサイト開発ソリューション', 'Javaを主力としたECサイト開発ソリューション。開発環境：Java、Javascript、Springboot、Seasar2、PostgreSQL。時間幅：150-180。募集人数：2〜3名程度。', 'SEPGクラス
5年以上のJAVA経験、WEB開発経験あり、基本設計対応可
上級PGクラス
5年以上のJAVA開発経験、WEB開発経験不問', '技術も大事ですが重視するのは人物像です。', '60〜65万程度', 60, 65, '野田阪神から徒歩3分', 1, '8月～長期', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('某総合商社向け見積・契約・受注システム開発支援', '某総合商社向け見積・契約・受注システムにおける設計〜開発業務全般
SPREADを用いた画面デザイン・修正およびWindowsFormアプリケーション開発
環境・ツール：VB.NET, SPREAD, WindowsForm, Windowsバッチ, PL/SQL, VB6.0
工程：基本設計、詳細設計、製造・開発、テスト', 'VB.NETにて基本設計以降を一人称で対応可能な方
SPREADを使用した画面デザインの実務経験（※修正等の経験でも可）
WindowsFormアプリケーションの開発経験
良好な勤怠状況、コミュニケーション能力', 'Windowsバッチの開発経験
PL/SQLを用いた開発経験
VB6.0での開発経験', '65円程度 ※経験・スキル見合い', NULL, NULL, '東陽町', 2, '2026年9月〜', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('CMS導入・カスタマイズPJにおけるPL募集', '既存の独自CMS（Java＋Oracle）をDrupalへリプレースするプロジェクト。パッケージ導入・カスタマイズ、HubSpot等とのAPI連携、PL業務および上流推進全般を担当。', 'プロジェクトリーダー（PL）としての実務経験（3年以上）
Java および Oracle での開発経験
上流工程（基本設計・詳細設計）の実務経験（3年以上）
AWS環境でのサービス構築経験
運用保守の設計経験
CMSの導入・カスタマイズの実務経験（※実際の経験が無くても、他で補えるスキル・経験があれば相談可）', 'Drupal または HubSpot の実務経験
性能対策、セキュリティ対策、および評価の経験
CMSを用いたシステムの運用保守経験', '85万円程度', 85, 85, '大手町（基本在宅、地方可）', 0, '8月〜　※前倒し検討可', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('精密測定機器開発支援', '精密測定機器開発支援／フェーズ：詳細設計～テスト', 'C#(Windowsアプリ）※目安3年以上
WPF
オブジェクト指向の理解', 'C++の経験あるとなおよい', '65～70万', 65, 70, '京橋、新大阪', 3, '8月～長期', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('情シス作業要員募集', 'iPhone・iPad・PC・その他周辺機器・ソフトウェアの調達、IT関連のヘルプデスク、バックオフィス業務、マニュアル作成作業', '清潔感あり、コミュ力あり（落ち着きがあって会話が弾む社交性のある方）
マニュアル作成のため、日本語文書力がある
事務作業経験（２年程度１人称）
ＰＣに関連する事務（発送、請求、資産登録等）
EXCEL資料作成（Vlookupは必須）※調べながらはＮＧ
iphone（IOS）操作経験　※業務以外・個人使用でも可
Apple製品ユーザーであり、基本的な操作や単語に問題がないこと
iPhone/iPadとアプリケーションの互換性など検証を行うことが苦ではないこと
事務経験があること
Microsoft Word、Microsoft Excel、Microsoft PowerPointの使用に問題がないこと
（Excel関数を自分で組め、他者の作成した関数も問題なく使用・修正できること）
常識的なビジネスマナー（会社での立ち振る舞い・電話応対・メール対応）が身についていること
職員から来たメールを読み解き、適切な回答を作成することができること
日本語マニュアルや文章を読み、内容を理解することができること
スケジュールを意識し、作業の優先順位を自身で組めること
マルチタスクが可能であること
体調不良による突発のお休みが年間3日以内であること。遅刻や早退がないこと
喫煙者はNG
肥満でない方', NULL, 'スキル見合い 〜35万まで（140-180）', NULL, 35, '飯田橋', 3, '8月〜', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手キャリア向けAIエージェントアプリ開発', 'AIエージェントを搭載したAndroid/iOS向けアプリ開発案件。Flutterを用いたモバイルアプリ開発をご担当いただきます。', 'Flutterを用いたAndroid/iOSアプリ開発経験
円滑なコミュニケーション能力', NULL, '55万前後（スキル見合い）', 55, 55, 'フルリモート（地方可）', 0, '2026年7月16日～　※継続の可能性あり', '2026-07-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('新会社設立に伴うシステム対応', '既存システムの改修作業。対象範囲調整中の為、対応システムの詳細については別途。工程：基本設計～総合テスト。役割：担当。', 'PL/SQL（3年程度）、Linux操作、Shell
連携先システムとのやり取り(調整)の経験
一般的なコミュニケーション力、理解力', NULL, '600,000円／月※スキル見合い', 60, 60, '品川駅徒歩8分', 1, '2026/8～', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('オープンシステム開発支援', '�オフコンのプログラムをJavaへ置き換える開発支援
�SPA（シングルページアプリケーション）開発支援', 'Java・SpringBoot・SQL・JavaScript（またはTypeScript）
生成AIの知識（現場経験や種類は問いません）', 'ストアドプロシージャ
Vue.JS・Angular・ReactいずれかのFW', NULL, NULL, NULL, 'JR「品川」駅（出社多め）', 2, '8月-長期', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('PCの(梱包や荷物運搬)業務', '作業内容は、軽作業に近い内容のため、特別なスキルは不要だが、ミスなく丁寧に作業できる事', '特別なスキルは不要だが、ミスなく丁寧に作業できる事', NULL, '日当11500円（交通費込）', NULL, NULL, '大阪市西淀川区（福駅）', 2, '8月単月　※以降も単月更新で10月末まで想定あり', '2026-08-01', 0, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('【基本リモート/都内出社あり＠都内】【リーダークラス】大型PJにおけるAP基盤開発（生成AI活用）エンジニア', '大型PJにおけるAP基盤開発（生成AI活用）', 'Java（Spring Boot、Spring Batch）を用いた開発経験
システムの要件定義・基本設計などの上流工程経験
設計から実装まで一貫して対応可能な方
チームリーダーまたはリーダーポジションでの開発経験
バッチ処理の設計およびレビュー経験', '業務要件と基盤要件を踏まえ、共通部品化などの課題を抽出し、方式設計へ落とし込めるスキル
アプリケーション共通部品の設計・開発経験
フロントエンド開発経験
生成AIを活用した開発プロジェクトへの参画経験、または生成AIに関する技術的知見', '60万～80万円※スキル見合い', NULL, NULL, '東京都/駅', 0, '7月 〜', '2026-07-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('事業会社内の社内SE', 'ネットワークや共有ディスクの問い合わせ業務や、ラック（サーバーラックではなくただのメタルラック）にサーバーや共有ディスクが設置されており、いざとなったら物理結線の確認や再起動などの実施。情シスの状況を見ていただき、課題の整理とアクションの策定・実施まで', '社内SEもしくは情シス経験3年以上', NULL, '55-60万（スキル見合い）', 55, 60, '秋葉原', 2, '8月〜12月（延長の可能性有）', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('画像センサを活用するためのアプリケーション開発業務', '開発および保守業務', 'C++の開発経験
Windowsアプリ開発の経験
関係者と円滑に連携し、調整・報告・相談ができる方', '①VB.netの開発経験
②VisualStudioの開発経験
③画像の知見（OpenCV、Halcon）、Git活用による開発経験
④FA機器（PLC等）の知見', 'スキル見合い　※ご提示ください。', NULL, NULL, '草津駅（滋賀県）', 2, '即日～　※時期は相談可能', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('ServiceNow　コーポレート業務の可視化', 'コーポレート業務の可視化・自動化（サービスカタログ、業務フロー実装）
各種申請やAppEngine要素（カスタムテーブル追加など）', '・システム開発歴 トータル5年以上
・ServiceNow開発経験
・ServiceNowのベストプラクティスを推進（むやみに開発するのではなく既存の製品機能を流用できる）出来るか
・PM、メンバーと、自ら積極的にコミュニケーションは行ってきた経験', '・顧客とのMTGで、開発状況を説明した経験
・要件定義、設計　経験
・JavaScript経験
・HTML、CSS経験
・DBに関する知識、実務経験', 'スキル見合い', NULL, NULL, '豊洲オフィス', 1, '8月中旬から', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('サーバー運用', '各種サーバの状態監視と障害時の対応
設定変更、パッチなどのメンテンス
利用者の問い合わせ対応
上記の業務実施上の手順作成、作業実施含む
顧客との技術的な折衝', '上記サーバを一部でも運用を行ったことがあること
問い合わせ対応、問い合わせに関連した調査をしたことがある
MAIL、DNS、WEB、DBサーバを立てて運用したことがある
Linux に関する基礎知識（基礎コマンドを利用、検索して使用できる）
ネットワークに関する基礎知識（IP アドレスとルーティング、DNSとの関係）
スクリプト作成（bash または python など）
業務上、資料作成が多いため、論理的な文章力および資料を視覚的に分かりやすく整理・表現できるスキルを有すること。', 'SMTPとその周辺の技術についての知識
SMTP、SPF、DKIM、DMARC、SMTP-AUTH、SMTPS、STARTTLS などの知識
POP、IMAPなどのクライアント知識
TELNET による送受信操作の知識
DNS、PROXY、NTP知識
上記で上げた各種ソフトを運用するために必要な知識
ソフトウェア内で稼働する DB の運用ができる人', 'スキル見合い（〜65万円程度）', NULL, 65, '池袋', 0, '8月〜', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('データ連携システム', '複数システムのデータ連携を行うチーム', 'Java
SQL（PL/SQLやストアド経験者が理想）
基本設計〜製造〜テストまで対応可能な方', 'Linux
Biz/Browser
売買系の業務知識', 'スキル見合い（MAX65万程度／140h-180h）', NULL, 65, '本町駅 or 堺筋本町', 2, '9月〜長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手通信キャリア向け 次期マイページ開発支援（AIネイティブエンジニア／PM枠）', '大手通信キャリア系企業の次期マイページ開発プロジェクト。現チームのPM層が離任予定のため、後任ポジションとして募集。開発チームに参画し、Claude Codeを活用した実装業務を中心に、チーム管理や開発プロセスの仕組み化も担当。', '・PMもしくはPM同等の経験をした方（チーム管理・進捗管理・品質管理など）
・Claude Codeを活用した開発経験
・Claude Codeを用いた開発基盤や運用ルールを構築できる方
・AIを前提とした開発プロセスを設計・推進できる方', '・PMまたはチームリーダー経験
・AIコードレビュー基盤の導入経験
・AI開発ツールをチームへ浸透させた経験
・要件定義など上流工程の経験', 'スキル見合い（80〜85万円が理想ですが、上振れも相談可能です）', NULL, NULL, '渋谷', 1, '8月半ば〜もしくは9月〜', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('某製造業向け基幹システム再構築プロジェクト', '製造業様の基幹システム再構築のプロジェクトに参画して頂きます。
ホスト系システムをオープン系システムに移行するプロジェクトです。intra-martで構築する機能の詳細設計以降を担当して頂きます。
別プロジェクトではintra-martをAIに使用するにあたり研究開発を行っていただきます。', 'intra-martの設計及び開発の経験
intra-martでのAI使用経験', NULL, 'スキル見合い（140-180h）', NULL, NULL, '梅田', 1, '随時～長期', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('インフラ基盤構築支援', 'VMware環境上でのLinuxサーバ構築および、各種ミドルウェア構築・設定をご担当いただきます。
複数案件が並行して進行する見込みのため、増員メンバーは別チームでの稼働を予定しております。
詳細手順がない状況でも、単独でLinuxサーバおよびミドルウェアの構築・設定・障害解析を進められる、即戦力レベルの方を希望しております。', '・VMware環境でのLinuxサーバ構築経験
・RHEL6〜9の設計、構築経験
・Linux運用コマンドおよびトラブルシュート経験
・Apache構築経験
・WebLogic構築経験
・PostgreSQL構築経験
・ネットワーク基礎知識
・主体的に構築作業を進められる方', '・Load Balancer（LVS＋Keepalived）構築経験
・クラスタ構成（Active／Standby）の設計、構築経験
・冗長化設計、構築経験
・フェイルオーバーテスト経験
・NFS、iSCSI構築経験
・ストレージ連携の経験', 'スキル見合い', NULL, NULL, '京橋', 1, '9月', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('NW構築および維持運用業務', 'お客様が展開しているサービスのNW環境の構築、運用業務（お客様が運用するデーターセンター作業が中心になります）', '主にCisco機器(L2/L3SW、FireWall等)設定および障害切り分け対応経験
LB（BIG-IP）構築経験
一から機器の設定を行ったことがある
障害切り分けは切り分けだけでなく一次、二次対応経験', '主担当として動ける方
ToDo,課題管理の推進が得意な方を歓迎', 'スキル見合い
※Max：60万まで', NULL, 60, '新宿御苑', 1, '8・9月〜長期', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Databricksを活用したAIエージェント基盤の設計・開発支援', '弊社支援中のお客様にて、Databricksを活用したAIエージェント基盤の設計/開発を進めており、以下の業務を担える人材を募集いたします。
Databricksに強みのあるデータエンジニアで、かつ、AIエージェントに知見をお持ちの方を強く求めております。
加えて、データ基盤への理解、生成AIアプリ開発経験があれば、当ポジションへの親和性が高いと考えております。', '・Databricksを用いたデータ基盤開発経験
・生成AI / LLM / RAG / AIエージェントに関する基礎理解', '・データマート設計・開発経験
・AIエージェント開発経験
・データガバナンス、セキュリティ、個人情報管理の経験
・BI / セマンティックレイヤー / KPI定義の経験
・大企業向けデータ活用・DX案件の経験', NULL, NULL, NULL, '阪急西院', 1, '8月　※9月開始も可', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手通信キャリア向けクラウドネイティブ環境ソフトウェアエンジニアリング支援', '大手通信キャリア向けクラウドネイティブ環境ソフトウェアエンジニアリング支援', '英会話ビジネスレベル
ソフトウェア開発経験5年以上
Java、Python、Goのいずれかの開発経験
APIバックエンド開発経験
もしくはKubernetes環境におけるアプリケーション設計／デプロイ経験
体調面に不安がなく勤怠が安定している方
お客様、チームメンバーと円滑にコミュニケーションを取り能動的に業務遂行できる方
積極的に学ぶ姿勢がある方', '日本語ビジネスレベル
Apache Kafkaの実務経験
PostgreSQL、MongoDB等データベースの設計／運用経験
AWS、Azure、GCP等クラウド環境およびIaC経験
Docker、Kubernetes、Helmチャートの設計／運用経験
CI/CDパイプラインの設計／構築／運用経験
OAuth2.0、認証認可基盤、HashiCorp Vault等シークレット管理経験
Prometheus、Grafana、ELK Stack等の監視／ログ基盤経験
IPネットワーク、ルーティング、スイッチング、セキュリティ知識
CNF（Cloud Native Network Function）導入／運用経験
B2B／B2C向け本番サービスの設計／運用経験
ペアレンタルコントロールサービスや通信サービス関連知識
CKA／CKAD資格保有者', '65～85万円（スキル見合い）', 65, 85, '二子玉川', 2, '2026年7月1日 ～ 長期', '2026-07-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('人材管理システム開発支援', '開発〜テスト
基本設計からの経験が数年ある方だと有難い
人数：1名', '何らかのWEBシステム開発経験3年以上
Goでの開発経験1年以上
React、MySQL、Dockerの経験
管理としてGitHub
何らかのAIツールで開発経験がある方
コミュニケーション力が抜群な方', 'Claude Codeの使用経験
VPS(Rocky Linux)
Jest、testing-library/react、
Playwright、golang/mock', 'スキル見合い(140-180H)', NULL, NULL, '江坂駅近辺（最初慣れるまでは江坂常駐予定。慣れてからは週2〜3日現場と週2〜3日弊社社内（大阪駅前第1ビル））', 1, '即日〜 ※9月可', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('AI活用 Webシステム開発支援（バックエンドエンジニア）', '生成AIを活用したWebシステム開発プロジェクトにおいて、バックエンド開発をご担当いただきます。ChatGPT、Claude、GitHub Copilot、Cursorなどの生成AIツールを活用しながら、設計・実装・レビュー・品質向上を推進いただくポジションです。', '・Pythonでの開発経験3年以上
・生成AI（Cursor利用経験必須★）を活用した開発経験
・AWS利用経験（構築経験不問、参画経験があれば可）
・能動的に業務を推進できる方
・コーディング規約、作業手順、チケット起票、勤怠連絡等のルールを遵守できる方', '・要件定義〜基本設計の経験
・生成AIを活用した設計・実装・レビューによる開発効率化の経験
・API Gateway、Lambdaを利用したAPI開発経験
・DynamoDB、OpenSearch、ElastiCacheを利用した開発経験
・コードレビュー経験', 'スキル見合い', NULL, NULL, 'フルリモート', 0, '即日〜（8月開始可）', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('運用チーム/Company→Oribic7移行', 'テスト計画の策定を中心に、システムが正常に稼働するかの確認に加え、人手で実施すべき業務とシステムで自動化すべき処理の切り分け、ならびに運用計画全体が実運用に耐えうるかの検証をご担当いただきます。', '・テスト推進、課題管理、進捗管理いずれかの経験
・ドキュメント作成経験（Excel / PowerPoint）
※テストの中でも、システムのテストではなく業務定着のテスト推進', '・PMOまたはPJ推進補佐経験
・人事給与システムPJ経験
・COMPANY または OBIC7 の知見
・移行リハーサル、運用テスト経験', '〜110万（清算幅 固定）', NULL, 110, '大阪駅', 2, '9月〜', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('人材システム維持業務', '運用監視・アラートの設定、設計、運用テスト', 'システム開発全般（要件定義〜運用保守）の経験があり自発的に推進できる方
維持運用業務の経験があり電話やメールなどでの顧客応対ができる方
コミュニケーションに問題がなく、主体的に業務推進できる方', NULL, NULL, NULL, NULL, '京橋', 2, '2026/08〜', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('AIデータセンター立ち上げ案件', 'AIデータセンター立ち上げのため、ネットワーク、ストレージ、サーバー／インフラ・エンジニアを募集。', '高いインプット能力と自走力：8月すぐに台湾出張や公トレーニングへの参加が予定されています。最先端のハードウェア仕様を短期間で叩き込めるキャッチアップ能力が必須です。
英語に対する抵抗感がないこと：ベンダーのマニュアルはすべて英語ベースとなるため、ドキュメントが読めるレベルの英語力は最低限必要ですが、翻訳等できるので抵抗がなければ問題ありません。
後進の育成・マネジメントへの関心：9月以降、現場には10?20名規模のオペレーターやインフラ担当者がアサインされます。メンバーを引っ張る技術指導やチームビルディングができる素養が求められます。
未知の領域でも自発的かつ前向きにキャッチアップできること', NULL, '100万　※スキル次第で上振れ可能', 100, NULL, '全国各地常駐（8月は台湾で研修予定）', 1, '8月～', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('半導体製造装置の開発', '半導体製造装置の開発。基本設計～。', 'C#での開発経験5年以上
コードレビューの経験
基本設計以降の経験
コミュニケーション能力が高く、フットワークが軽い方（能動的に動ける方）
長期参画可能な方
富山に出張対応可能な方', '制御系開発経験（尚可）
装置開発の経験（尚可）', '70万～75万', 70, 75, '鶴見小野駅　※富山へ出張あり（月1回程度）', 2, '8月～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('電子決裁システム次期開発（管理者：PMO/リーダーポジション）', '約15名体制で進行中のWebシステム開発案件にて、プロジェクト推進・統制を担う管理者ポジション。進捗管理、課題・リスクの可視化、タスク整理、開発状況レビュー、関係者調整・エスカレーションを担当。', 'Webシステム開発における実務経験（5年以上）
進捗管理・メンバ管理の経験
課題解決に主体的に動いた経験', 'PLまたはPMO経験
ASP.NET（C#）での開発経験
SQL Serverの使用経験
Web Form（ASP.NET）経験
SharePoint開発経験
トラブル案件の立て直し経験', '90万円前後　上振れご相談可', NULL, 90, '分倍河原駅 徒歩3分', 2, '2026年8月～2026年12月　※2027年以降も継続可能性あり', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('金融機関向けバージョンアップ支援作業', '金融機関向けバージョンアップ支援作業。Java VerUp対応（方針決定、影響調査、設計、環境構築、改修、テスト、リリース）。', 'スキル①
JavaのVerup対応の経験がある方。
Verup対応案件で設計以降のご経験がある方。
Spring環境で開発経験がある方。
スキル②
アーキテクチャ設計、技術選定経験、非機能要件設計、共通基盤設計、いずれかのご経験がある方。
Java（Spring）での開発経験がある方。', NULL, 'スキル①　70万～75万まで目安（精算有140-200h）
スキル②　85万まで目安（精算有140-200h）', 70, 85, '池袋', 2, '8月～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('通信会社向け開発支援作業', '通信会社向け開発支援作業。先行開発（製造・テスト）。', 'Javaでの開発経験が4年以上あり、Springを使用した開発経験がある方。
基本設計以降のご経験がある方。
フロント画面からバックエンドまで開発経験がある方。
アーキテクト設計、先行開発 、AP基盤チーム、いずれかのご経験がある方。', NULL, '80万まで（精算有140-200h）', NULL, 80, '八丁堀（駅から徒歩7分程度）', 2, '9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('飲料メーカー向け開発支援', '飲料メーカーの情シス部門と連携しながら開発業務に従事。', '要件定義以降の経験
開発経験10年以上
Java(Springboot)開発経験
React開発経験　※類似FWでも可
顧客折衝経験', 'リーダー経験', '～100万（精算固定）', NULL, 100, '田町', 1, '8月or9月～長期', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('通信会社向けバージョンアップ支援作業', '通信会社向けバージョンアップ支援作業。Java VerUp対応（影響調査、設計、環境構築、改修、テスト、リリース）。', 'JavaのVerup対応の経験がある方。
Verup対応案件で設計以降のご経験がある方。
Spring環境で開発経験がある方。', 'Verupに伴うライブラリ検討経験がある方が望ましい。', '～75万まで目安（精算有140-200h）', NULL, 75, '横浜（初月は1～2週間の出社期間あり）', 1, '8月下旬or9月～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('官公庁向け設計開発支援作業', '官公庁向け設計開発支援作業。要件定義～リリース。', 'Java（Spring）での開発経験がある方。
要件定義または基本設計以降のご経験がある方。
AngularJSまたはその他Javascript系フレームワークでの開発経験がある方。
コードレビューのご経験がある方。', 'AWS環境のご経験があれば尚可。', '70万目安（精算有150-200ｈ）※スキル見合い', NULL, NULL, '田町', 1, '9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('インフラ構築支援作業', 'インフラ構築支援作業。基本設計～。', 'インフラ経験4年以上', 'VMware設計構築経験、基本設計または詳細設計～経験（尚可）', '70万まで（精算有150-200h）', NULL, 70, '田町（環境設定で1～2週間我孫子に行く可能性あり）', 1, '8月～長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('郵便業向けクラウド移行', 'オンプレミスからクラウド（OCI）への移行案件（リフト）。要件定義開始前の検討フェーズから参画。', 'クラウド設計構築経験者（経験8年以上目安）
要件定義以降の経験
オンプレミスからクラウドへの移行経験
ミドルウェア知見保有者　※全て満たさなくてもOK
Cluster Pro
JP1（ジョブ）
Trendmicro
Web（Apache)
NewRelic', 'OracleCloud構築経験', '～80万　※経験次第で上振れ検討可能', NULL, 80, '五反田', 2, '8月中旬or9月～長期　※2028年2月リリース予定', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('協働ロボットの制御に関する研究開発', 'デンソーウェーブが開発した産業用人協働ロボット（COBOTTA）を特定用途にて利用する為の制御プログラムの研究開発。調査・検討・試作・評価等。', '制御系開発経験者
python開発経験
ROS2（ロボット制御用のフレームワーク）の知識
ロボット制御に関する知見をお持ちの方
コミュニケーション能力', NULL, '～60万', NULL, 60, '札幌', 2, '8月～', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('通信会社向けユーザー支援作業', '通信会社向けユーザー支援作業。要件定義、ユーザー・海外ベンダー調整、レビュワー対応など。', 'オープン系システムの設計開発経験がある方。（言語不問）※経験7年以上目安
要件定義のご経験がある方。
レビュー経験がある方。', '※Java開発経験があれば尚可。
※インターフェース設計（IF設計）経験があれば尚可。
※ユーザー社員代替経験があれば尚可。
※請求システムの知識があれば尚可。', '70万～73万まで目安（精算有140-200h）', 70, 73, '品川シーサイド', 2, '9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('銀行員様向け情報管理システムの外部API設計構築', '外部API構築におけるセキュリティ設計テスト、およびサーバ設計構築に伴う運用設計、shell開発。', 'インフラ設計構築経験5年以上
AWS設計構築経験3年以上
ALBCloudFormationの経験
CloudFormationの経験
Apache、Tomcat設計構築経験
Webサーバおよびアプリケーションサーバ設計のレビュー経験
独力で不明点を調査し作業を進められる
顧客とはテキストベースのやりとりが中心の為、事実を正確に伝えられる文章スキル/資料作成スキル
インシデント発生時の休日出勤がご相談可能な方（後日振替休日を取得いただきます）', 'WAS/IHS設計構築経験', '～75万', NULL, 75, '品川', 2, '2026年8月～2027年6月', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大規模製造業システム開発PJ PM・PMO支援', '大規模製造業システム開発プロジェクトにおけるPM・PMO業務。複数プロジェクトが並行して進行しており、PM2名PMO3名を募集。顧客との各種ミーティング対応、課題管理、進捗管理などプロジェクト推進業務。技術的な対応はエンドメンバーが担当するため、プロジェクトマネジメント業務が中心。スキルに応じて最適なプロジェクトへアサイン予定。', '・開発プロジェクトにおけるPM・PMO経験
・顧客折衝経験
・課題管理、進捗管理経験
・フットワークが軽く、迅速かつ柔軟な対応が可能な方
・素直で誠実な人柄で、周囲とのコミュニケーションも円滑に行える方', '・大規模プロジェクト参画経験 ※製造業の経験は問いません
・女性の方(PMOの方の場合)
・PMはシニアの方がよい
・英語が使用できる', 'PM：～100万円 PMO：～120万円 目安（スキル見合い、相談可）', NULL, NULL, '名古屋（伏見駅）', 1, '9月以降予定(PMはもう少し早い可能性あり)', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('プロダクトのカスタマ問合せ対応のSalesforce保守エンハンス', '大手企業プロダクトのカスタマ問合せ対応のSalesforce保守エンハンス運用保守の上流工程をお任せします。
・中規模、大規模な機能改修の要件定義ならびに案件推進
・SFメジャーバージョンアップにおける影響調査と対応実施
・データメンテナンスやデータ出力などの定期運用
・不具合や仕様確認などの問合せ対応', '・Apex/LWCコーディング経験
・Salesforceの設定変更経験
・Salesforceの要件定義/基本設計/テスト計画検討経験
・本番環境にログインしてのデータ調査や仕様調査、リリース作業経験
・Salesforce周辺システムとの外部接続における上流工程やコーディング経験
・SalesCloudやServiceCloudの概要理解
・クライアント様との仕様調整経験
・リモートワークでの自己管理能力とコミュニケーション能力
・Salesforce関連業務５年以上
・不確実性が高く、仕様変更が頻繁に発生する環境をポジティブに楽しめる方
・指示待ちではなく、技術的観点から最適な実装方法や仕様を自ら提案できる自走力のある方', '・Salesforce以外のWeb系サーバーサイド開発経験
・カスタマ問合せ対応関連システムの運用保守経験
・リーダーとしてのメンバースケジュール管理経験', 'スキル見合い(~MAX95万円)', NULL, 95, '恵比寿', 1, '即日開始～長期', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('商用サービス維持管理（コンテナ要員）', '通信キャリアがエンドユーザ向けに提供しているサービスが稼働するコンテナ基盤のバージョンアップ対応を実施する。各環境（開発／検証／商用）でのシステム変更対応や検証（導入に伴う手順書作成、検証項目の検討・実施など）。各種ドキュメント作成（設計書、マニュアル、手順書、検証項目作成、結果報告資料作成など）。', 'Linux OS の一般的な操作スキル（IT経験10年以上目安）
OS／ミドルウェアのインストールや設定
Linux上でのコマンド操作
OpenShift、Kubernetes、Jenkins、GitLab を利用したコンテナ環境検討および構築スキル
未経験技術の調査検討スキル
主体的に作業を進められるコミュニケーションスキル', 'ドキュメント作成修正スキル
システムやアプリケーションの設計検討から試験実施・結果取りまとめまでのスキル
Pacemaker、PostgreSQL、Apache／Tomcat の知識または知見
AWS ECR の知識または知見', '～70万円', NULL, 70, 'テレワーク／渋谷。三鷹、代々木での現地作業あり。週の半分以上は渋谷出社になる可能性あり', 1, '8月または9月～12月（延長の可能性あり）', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('損害保険／システム保守、開発', '団体、請求精算、代理店データ提供', 'COBOL（汎用機）、日立マシン経験　勤怠面問題ない方', '損保経験
保守経験
請求精算業務
管理能力', '～50万（スキル見合い）', NULL, 50, '大江戸線　光が丘より徒歩15分 または 有楽町線　地下鉄成増よりシャトルバス10分', 1, '2026年9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Windowsサーバ基盤更改・クラウドリフト支援', 'オンプレ上WindowsサーバをAzure上へ移行
OS更改（Windows Server 2016 → 2022/2025）含む', 'サーバ設計
サーバ構築（監視設定）
※Azure、zbbix、JP1を使用', 'VMWareでのサーバ構築
クラウドでの監視構築経験
テストシナリオ作成
Veeamの知識', 'ご提示ください', NULL, NULL, '梅田またはリモート', 1, '2026年9月頃～11月頃（延長の可能性あり）', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('製造業向けパッケージ開発', '製造業向けパッケージ（生産管理システム）の顧客ごとに行うアドオン開発', 'C#での開発経験（5年目安）
※C#メインで他言語も経験している方でもOK
コミュニケーション力
積極的な取り組み姿勢
詳細設計経験', '20代中盤～30代中盤', '60万(スキル見合い)※相談可', NULL, NULL, '肥後橋(大阪)', 2, '9月～', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('ハウスメーカー向け基幹システム開発', 'メーカー企業においての基幹システム開発支援となります。', '基幹システムの開発経験
C#.Netでの開発経験(目安3年以上)
短期終了案件が多くない方
コミュニケーション力問題ない方
長期での参画問題ない方', NULL, '55～60万想定', 55, 60, '梅田　or　四ツ橋', 2, '9月～', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Java／JavaScript開発支援（基本設計〜／名古屋・基本リモート）', 'Java／JavaScriptを用いたシステム開発案件です。基本設計以降の工程をご担当いただきます。画面系・バッチ系双方の開発に携わり、DB検索・更新機能やバッチプログラムによるDB更新、HULFTを利用したシステム間連携などをご対応いただきます。', 'Javaでの開発経験
JavaScriptでの開発経験
基本設計から一人称で対応可能な方
エンジニア経験5年以上
名古屋在住、または名古屋への出張が可能な方
基本リモート勤務に対応可能な方', 'RHEL9環境での開発・運用経験
PostgreSQLの利用経験
クラスタ構成に関する知見
Perlによるバッチ開発経験
シェルスクリプト作成経験
HULFTを利用したファイル連携経験
Apache／Tomcat環境でのWebアプリケーション開発経験
GUI画面からのDB検索・更新機能開発経験', '〜65万円まで', NULL, 65, '基本リモート（名古屋在住者優先／名古屋への出張対応可能な方）', 1, '2026年9月1日〜年度内（長期予定）', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('地方銀行向け印鑑システム開発（品川）', '地方銀行向け印鑑システムにおけるオープン系（Windows系）の開発・構築対応。印鑑Webサーバの新規構築、およびアプリケーションの新規開発（タブレット用REST APIの開発含む）。印鑑票データ登録バッチ開発。', '・C#開発経験3年
・基本設計経験', '・要件定義経験
・保守対応経験
・金融経験', '60万~65万', 60, 65, '品川', 1, '8月or8月中旬', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('金融機関向け学務情報統合システム インフラ設計・構築', '金融機関向け学務情報統合システムにおけるインフラ基盤の設計・構築案件です。Windows Server環境を中心に、RDS・VDI・Active Directoryなどのミドルウェア設計・構築からテスト、運用設計、ドキュメント作成までを一気通貫でご担当いただきます。', 'Windows Server（OS / Hyper-V / Active Directory）の基本設計以降の実務経験
RDSおよびVDIの基本設計以降の実務経験
基本設計から検証、構築、試験、運用設計、ドキュメント作成までを一人称で対応できる方
岩手県への短期出張（構築・テストフェーズにて約1週間）に柔軟に対応できる方', 'VPCC（VirtualPCCenter）およびSSC（WebSAM SigmaSystemCenter）の基本設計以降の実務経験
プロキシサーバ（リバースプロキシ含む）の基本設計以降の実績
ESXiに関する知見・実務経験（※検証環境として利用のため）
プロジェクトマネジメント補佐（PMO/リーダー）の経験
PrismAccess（ゼロトラストソリューション）の設計・構築経験', '70万円 〜 75万円（スキル・経験見合い）', 70, 75, '西新橋（※構築・テストフェーズにおいて岩手県へ約1週間の出張あり／出張費精算可）', 1, '即日 ※ 約1年間（長期予定）', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('業務用サーバAzure環境移行プロジェクト', '業務用サーバのAzure環境への移行プロジェクト支援。現在テストフェーズとなっており、8月より本格的なAzure本番展開を実施。Azure環境への移行作業、展開対応、運用支援、各種調整業務を担当いただきます。', '・システム運用／保守経験（3年以上）
・Azure環境に関する知見
・円滑なコミュニケーション能力
・夜勤対応可能な方（毎週最大3日程度のシフト）
　※日勤夜勤の通しは想定しておりません。', '・クラウド環境移行経験
・インフラ運用経験', '〜50万円', NULL, 50, '海浜幕張（リモート併用）※着任1ヶ月程度は常駐予定', 1, '2026年8月中旬〜2026年11月※延長可能性あり', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('製造業向けデータ基盤構築', 'SAPを基幹システムとして周辺システムのためのデータ基盤構築、および、レポートを提供する開発案件
作業工程：要件定義、開発、移行○データ移行対応
テーブルの設計、レポート開発作業', 'SQL
テーブル設計
レポート設計
DatabricksまたはAzure Data Factory（ADF）の経験', 'ETLツールの開発経験
Power BI', '70万前後（スキル見合い）', NULL, NULL, NULL, 1, '2026年8月～', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('代理店システムの保守開発（SE/PG）', '変更仕様作成～改修～テスト を一人称で対応', 'PHPで仕様作成～改修～テストを一人称で出来る方', NULL, 'スキル見合い', NULL, NULL, '品川', 1, '即日～', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('各種業務自動化開発(VBA、RPA等)', '各種業務自動化開発(VBA、RPA等)', '要件定義書、業務および処理フロー、テスト計画書作成経験
RPA(UiPth)
VBA', NULL, 'スキル見合い(140-180h)', NULL, NULL, 'ドーム前', 3, '即から長期', NULL, NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('公共系 Java Webアプリケーション開発支援', 'inspirX（CRMパッケージ）開発支援', '①Javaとフレームワークを用いたWebアプリケーションの開発経験者（上級ＰＧ）
②詳細設計～開発～結合テスト迄の一連作業が対応可能な方
③年齢：45歳前後迄', NULL, '67万円前後（スキル見合い：精算有り140h-180h）', NULL, NULL, '神谷町', 1, '即日又は、9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('銀行 国内融資システム更改', '国内融資システム更改（融資アーキ案件）', '①Javaのバックエンド、フロントエンドの開発経験者をそれぞれ募集いたします。
Javaのバックエンド側の開発経験者（開発経験5年以上）：2名
JavaScriptのフロントエンド側の開発経験者（開発経験3年以上）：2名
②基本設計又は、詳細設計～開発～結合テスト迄、一連作業が可能な方
③年齢：50歳前後迄', NULL, '～67万前後迄（スキル見合い：精算有り140H～190H）', NULL, 67, '中野', 1, '9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('インフラ,M365,Azure', 'Microsoft社関連インフラの設計・構築作業', '・Microsoft 365の設計・導入の経験
・Azureの設計・導入の経験', '・顧客折衝のご経験
・リーダー経験をお持ちの方', 'スキル見合い（150‐180h）', NULL, NULL, '京橋駅', 2, '随時 ※長期予定', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('サーバ運用保守', 'サーバ運用業務・問い合わせの2次対応', 'サーバ運用のご経験（Linux、Windows）
コミュニケーション能力、主体的に取り組める方', NULL, 'スキル見合い（140−180H）', NULL, NULL, 'JR灘（または阪神岩屋）', 1, '8月または9月〜', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('某製造業NW設計・構築・運用', NULL, 'Ciscoのスイッチ、FW、ルータ等の構築・運用経験', '運用よりでも1人称で手順書作成や実機操作の経験あれば検討可能', 'スキル見合い（140-180ｈ）', NULL, NULL, 'JR加古川（または東加古川、山陽別府）からバス', 3, '8月〜随時', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('システム開発業務', 'WEBアプリ画面開発、バッチなど
工程：要件〜基本設計、詳細設計、製造〜テスト〜保守', 'Java（必須）
Oracle（PL/SQL）
VB.NET等でのシステム開発
Oracle（DB）のテーブル設計経験
SQL,PL/SQLのチューニング
基本設計、詳細設計の実務経験
基幹系システムの知識・経験（生産管理など）
1人称での作業（調査・設計・開発）', NULL, 'MAX55万（精算あり）', NULL, 55, '西明石駅　バス約20分', 2, '即日〜長期', NULL, 3, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('NW設定業務', 'IP変更、通信機器刷新対応
・通信機器設定
・現場作業（事前確認　更新　事後確認）', 'NW構築経験
Cisco　ルータ、L2/L3スイッチの構築・設定変更経験
設計書、NW運用資料などの作成経験
小規模NW案件のコントロール、スケジュール管理
コミュニケーション能力', 'paloAlto Networks/FotiGateなどのF/Wの構築・設定変更経験', 'スキル見合い（140-180H）', NULL, NULL, '伊丹市', 2, '10月〜', '2026-10-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('NW運用保守/設計構築業務', '・NW保守（Cisco、FrotiGate、Aruba　AP）
・日次・週次・月次作業や資料作成
・機器監視業務および障害対応
・通信申請書依頼作業
・ウィルス対策管理業務', 'NW運用保守経験
Config作成、WAN,LAN、L2,L3　NW構築
NWの設計、構築経験（サポートでも可）
設計書、NW運用資料などの作成経験
コミュニケーション能力
（内部調整、顧客調整、問い合わせ対応等）
CCNAレベルのスキルは必須です', NULL, 'スキル見合い（140-180H）', NULL, NULL, '野田', 2, '10月〜', '2026-10-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('販売物流システム開発業務', 'WEBアプリ画面開発、バッチなど
工程：調査分析〜基本設計、詳細設計、製造〜テスト〜保守', 'VB.NET、SQL、ストアドシステム開発経験（必須）
WEBシステム開発経験（必須）', '生成AIツール使用経験（Github、Copillot、JITERA、GitLab）
ASP.NET　CORE（MVC　C＃）開発経験', 'スキル見合い（精算あり）', NULL, NULL, 'JR西大路駅', 1, '10月〜12月末　＊長期の予定', '2026-10-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('某金融機関NW設計・構築・運用', 'OSのパッチ適用', 'NWの設計・構築・運用経験（5年以上）
1人称で動けること・手順書が無くても試行錯誤して作業出来ること', NULL, 'スキル見合い', NULL, NULL, '千里中央', 3, '8月中旬〜', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('公共系保守案件', '保守案件。ツールでの開発', '開発経験
ツールでの開発になるため、言語は問いません', NULL, '37万程度（140-190H）', NULL, 37, '堂島・大阪駅（堂島DCと大阪駅の2拠点の徒歩での行き来があります）', 2, '10月〜長期', '2026-10-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('生産・販売・財務管理システム開発業務', '保守運用業務全般　問い合わせ・システム改善など', 'VB.NET、Accessのご経験
システム保守業務経3年以上
自身のタスク管理ができること
システム改善の工程の理解、実務経験（設計〜リリース）
コミュニケーション能力、主体的に動けること', NULL, '45万程度（140-180H）＊交代のため', NULL, 45, '南茨木駅（阪急・モノレール）', 1, '9月以降〜　長期', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('政府共通プラットフォーム監視Zabbixバージョンアップ対応', '官公庁向け第2期政府共通プラットフォームの監視Zabbixサーバー（6.0→7.0）のメジャーバージョンアップ対応。影響調査、移行方式の検討、バージョンアップ作業、各種テスト、設計書更新を担当。RHEL8.10環境を維持したまま、問い合わせ対応や調査を行いながら移行を推進。AWS（EC2）環境での監視基盤更改案件。工程：基本設計～テスト', '・Zabbixサーバーの基本設計以降の実務経験（2年以上）
・Red Hat Enterprise Linux環境でのサーバー構築経験
・Zabbixのメジャーバージョンアップ対応経験
・Pythonコードの解析およびコーディング経験', '・製品サポートへの問い合わせ等を通じて課題解決を行った経験
・主体的に課題調査・推進ができる方
・AWS（EC2）環境の運用経験
・WBS作成、課題管理、顧客説明などのプロジェクト推進経験', 'スキル見合い', NULL, NULL, '橋本', 1, '2026年8月1日～2026年12月28日', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('組合向けの管理システム', '設計以降を対応いただきます。詳細は面談にお伝えします。', 'WEBアプリケーションの開発経験3年以上
TypeScript（Next.js）におけるFE+BEの開発経験
フル出社が問題ない方
コミュニケーションが問題ない方
Claude CodeやCursorなどのAI活用経験', 'Laravelでの開発経験', '80万', 80, 80, '新宿', 2, '8月希望', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('建設業向け社内システム 改修・機能追加（VB.NET / Oracle）', '建設業様向け社内システムの改修および機能追加開発業務
・基本設計・詳細設計、プログラム開発（コーディング）
・試験要領書の作成および単体・結合テストの実施
・顧客（エンドユーザー様）との仕様打ち合わせへの同席・打ち合わせ対応', '・VB.NET（Windows Forms）を用いたシステム開発・改修の実務経験
・Oracle（SQL）を用いたデータ操作・開発実務経験
・Gitを用いたソースコード管理・バージョン管理の経験
・円滑かつ能動的なコミュニケーションが取れる方', '・建設業界向け社内システムや業務システムの開発経験
・最上流（要件定義・顧客打ち合わせ・調整）からの参画経験
※以下のいずれかのコンポーネント・ツールの利用・開発経験があれば尚可です。
（ActiveReports / ExcelCreator / TrueDBGrid / ComponentOne）', '～55万円（※スキル見合い）', NULL, 55, '亀戸（駅徒歩5分）', 2, '2026年8月 または 9月～2026年12月末（※延長の可能性あり）', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('保険　新規システム開発（Java改修）', 'Java/Spring bootを使用したバッチの改修
Reactを使用したwebシステムの開発改修・テスト', 'WEB/Javaシステムの知識・開発経験（1年以上）', 'Reactの開発経験
保険の業界知識', 'スキル見合い（140～180h・中間割160h）
※Max65万程度', NULL, 65, '梅田', 1, '2026/9/1～2026/10/31（延長予定）', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('受発注システム開発（Java詳細～）', '詳細設計～単体テスト', '基本設計からテスト経験（修正のみ経験の方不可）
ドキュメント作成能力はそれなりに求められます
Java
SQL（得意な方）', 'ASTERIA（あれば特に歓迎）
顧客との折衝経験
Intra-mart（今回の作業対象は使いませんが、PJ全体では使用されています）
PowerPointを用いたドキュメント作成
プロジェクト管理スキル（スケジュール管理、タスク管理）', 'スキル見合い（140～180h）
Max65万程度
精算単位15分 / 45日サイト', NULL, 65, '西三荘', 1, '2026年09月～2027年1月末
2026年10月～2026年12月末', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('【PjM】AI領域におけるプロジェクトマネージャー募集案件', 'AIに関わる導入コンサルティングやプロダクトを提供しているエンドにて、専任プロジェクトマネージャーとして、各開発案件のプロジェクトマネジメントをして頂きます。', '・下記いずれかがある方
（１） 上流ポジション（PMやコンサル, PdM等）且つ エンジニアとしてのご経験
（２） Dify等のLLMオーケストレーションツールを使用したPoC推進のご経験
・共通
　- 顧客課題をヒアリングし、要件やプロトタイプへ落とし込んだ経験
　- AI領域に関する実務経験 もしくは 興味関心', NULL, '〜140万円程度', NULL, 140, '西新宿（基本出社 ※在宅希望の方でもキャッチアップ（最低1カ月）は出社、その後は頻度相談可）※リモートベースの考え方の方はお控えくださいませ。', 2, '随時〜', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('ストレージベンダーのProfessional Service業務', 'ストレージ・関連ソフトウェアの設計/構築/テスト
Workshop/技術移管
データ移行', '英語に苦手意識がない（メール文の読解と返信できるレベル）
コミュニケーション良好（報連相ができる）
ストレージ構築・運用経験（ベンダー不問）
顧客窓口や顧客対応経験
NetApp製品を扱った経験', 'プロジェクトリーダーの経験', 'スキル見合い（ご希望の金額をご提示ください）', NULL, NULL, '梅田(在宅が中心)、導入顧客先', 1, '即 ～長期', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('上位システム（駅務）開発案件', '既存チームに加わり、C#やPL/SQL（Oracle）を用いた開発業務を担当いただきます。
詳細設計、開発、検証', 'C#、Oracle（その他DBも可）などの開発経験3年程度', 'バッチ作成、FTP、OracleDB構築', '時給精算', NULL, NULL, 'JR野洲駅', 1, '即 ～ 12月を予定', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('某電力会社向けインフラ基盤移行（独自基盤→Azure）', 'プロジェクトマネジメント業務
・システム利用ユーザーとのコミュニケーションを通じて、要件整理・課題整理
・作業・タスクを計画に落とし込み、進捗管理
・大小さまざまな案件について電力会社内の各部署との調整
・現行ベンダとの調整業務', '・プロジェクトマネジメントの経験ある方
・インフラ、クラウドにおける上流経験
・ITリテラシーの低い方に対してのコミュニケーションが慣れている方
・ドキュメント作成
・PJTにおける情報整理や本質的に捉えられる方', NULL, 'スキル見合い（～110万程度）', NULL, 110, '三越前', 3, '即日～2027年1月まで(継続になる可能性あり)', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('《元請直案件》大規模会員管理システム拡張プロジェクト開発支援（Rubyエンジニア募集）', '新規プロダクトの立ち上げメンバーとして、物販・コンテンツ配信・リアルイベント連動・アンケート配信などのプロダクトをゼロから開発し、団体活動を一元的に支えるプラットフォームを構築する。既存の会員管理・決済機能を拡張し、団体の収益化・エンゲージメント向上・運営効率化を支援する基盤を設計・開発。', '・Ruby on Railsの開発経験3年以上
・Web開発経験3年以上
・詳細設計経験フェーズ以降のご経験
・既存システムのコードを読み解き、改修・改善が行える方', '・基本設計から経験があると尚可
・要件定義や機能優先順位整理など、上流工程の経験
・顧客折衝やエンジニア以外のメンバーとの協働経験
・BtoB向け業務系Webサービスの開発経験', '65万　※スキルによっては上振れ可能性あり', 65, 65, '代々木駅・新宿駅', 1, '即日 or 2026年6月〜（初回1ヶ月、その後3ヶ月ごとに更新。長期継続前提）', '2026-06-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('脆弱性管理ソリューションの導入支援', '・脆弱性ソリューション、チケット管理システムのPoC
・PoC内容の検討、評価、報告資料の作成
・採用ソリューションの構築、運用手順の策定
・手順の検討、手順書の作成
・課題解決のためのサポート
・顧客、関連組織からの問い合わせ対応、助言、支援
・各種会議の準備（アジェンダ作成等）、ファシリテート、議事録作成
・スケジュール管理
・セキュリティ/システム導入に関するアセスメント、運用、アドバイザリ', '・脆弱性管理に関する知識、運用経験
・製品ソリューションのPoC経験
・セキュリティ技術要素に関する実践的な知見
　※ファイアウォール、IDS/IPS、認証、暗号化、ネットワークセキュリティなど、
　　主要な技術要素の仕組みや実運用における役割理解と業務活用経験
・お客様との調整やシステムベンダ等との調整を、一人称で円滑に実施できるコミュニケーションスキル
・提案書、報告書、打ち合わせ資料等を作成できるスキル', '・脆弱性管理ソシューション（Tenable、Qualys、Rapid7など）の構築、運用経験
・チケット管理システム（JIRA、Backlogなど）の構築、運用経験
・CSIRT構築、運用支援
・プロジェクトマネジメント経験
・技術情報等の収集・調査に必要な英語文書の読解力
・海外ベンダーや海外顧客担当と英語のメール及び会話によるコミュニケーション力', '80-100万円（上振れ要相談）', 80, 100, '海浜幕張（週2出社・週3リモート）多少変動有', 1, '9月～ 2027年2月まで（以降は案件状況により相談）', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('自社プロダクトを開発するベンチャー企業での労務案件', '自社プロダクトを開発するベンチャー企業において、従業員情報の管理や給与計算、そのほか労務に付随する業務をお願いします。', '事業会社での労務実務経験3年以上 ※SES自社内でのご経験ですとスキルミスマッチとなります', NULL, '70万円まで ※スキル見合い', NULL, 70, '西新宿駅', 1, '即日 / 8月〜', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('二次元コンテンツを扱うサービスのバックエンド開発案件', '大手事業会社での各種開発や運用保守業務をお願いします。', 'アダルトコンテンツに抵抗のない方
PHP(Laravel)を用いたサーバーサイドの開発経験3年以上
ドメイン駆動設計(DDD)を用いた開発経験1年以上
数十万レコード以上のWebサービスの開発経験
テスト仕様書の作成およびテスト実施まで一貫した経験
JavaScriptを用いた開発経験
コードレビューの経験', 'パフォーマンスチューニングのご経験
イベントストーミングの実施経験', '100万前後まで ※スキル見合い', NULL, 100, '六本木一丁目', 1, '即日 / 8月〜', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('旅行会社向け 営業日報システムリニューアル開発', '旅行会社が利用する「営業日報システム」のリニューアルおよび保守業務
・アジャイル手法での設計、製造（コーディング）、テスト
・既存システムの調査や、リニューアルに伴う機能追加・改修', '・PHPおよびLaravel（または他MVCフレームワーク）を用いたシステム開発の実務経験（2年以上）
・Docker環境での開発経験
・SEPG枠：一人称での設計（基本設計・詳細設計）が可能なスキル
・PG枠：設計書を理解し、実装・単体テストを自走して進められるスキル', '・ユーザー対応や、エンドユーザーからのヒアリング・要件調整などの経験
・ウォーターフォールおよびアジャイル、両方の開発手法での参画経験
・Amazon ECSなど、AWS環境を用いた実務経験', '～55万円（スキル見合い）', NULL, 55, '西新宿', 1, '7月～長期', '2026-07-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手キャリア様向けAIエージェント搭載アプリ開発（Flutter）', '大手キャリア様向けのAIエージェントを搭載したアプリの開発です。「Flutter + AI駆動開発」でのAndroid/iOS向けのアプリを作成する形となります。', 'Flutterを使用したAndroid/iOS向けアプリ開発の経験。
プロジェクトメンバーとのコミュニケーションが十分にできること。', NULL, '50～55万前後', 50, 55, NULL, 0, '7/30 or 8/3～', '2026-07-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('某企業向け情報システム運用サポート案件', '客先内ヘルプデスクを中心に、PC・ネットワーク運用保守、ITインフラ管理、ベンダー調整などを担当する情報システム運用支援案件です。', 'ITサポートまたはヘルプデスク経験
PCキッティング経験
PCおよびネットワークの基本知識、保守経験
Excelマクロ構築経験
休日、夜勤対応可能な方', NULL, '∼45万（140h∼180h）', NULL, 45, '福島駅（大阪）または赤坂（東京）', 2, '即日～　※スキルにより中長期想定', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('交通系ToCサービスのバックエンド開発案件', '交通系ToCサービス開発プロジェクトにおいて、バックエンドシステムの開発を担当をお願いいたします。
・要件定義〜技術設計
・バックエンド開発
・DB設計
・SQL実装
・パフォーマンスチューニング
・プロダクトリリース対応 etc', 'Pythonを用いたWebアプリの開発経験
10名以上の規模でのPM / PL経験
自社開発企業でのtoBtoC向けサービスの開発経験1年以上
数百テーブル数以上のDBでの設計・構築経験
DBのパフォーマンスチューニングのご経験
要件定義から技術設計に落とし込んだご経験
クラウド環境での開発経験', 'BigQueryの利用経験
Terraformを用いたIaC経験
GCP環境での開発経験', '80〜120万円 ※スキル見合い', 80, 120, NULL, 0, '10月〜', '2026-10-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('資産運用会社様向け 社内システム開発案件', '資産運用会社の社内システム（画面、帳票、バッチ）の設計、開発、テスト', 'VB.net開発経験3年以上
Excel VBA開発経験
SQL Serverの利用経験
基本設計〜1人称', '要件定義〜1人称
資産運用、又は、証券に関する基本的な知識
JP1、DataSpiderの実務経験', '65万程度　※スキル見合いで応相談', NULL, NULL, '九段下', 1, '9月（2026年12月31日まで、以降長期を予定）', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('CMS導入・カスタマイズPJにおけるPL募集', '既存の独自CMS（Java＋Oracle）を「Drupal」へリプレースするプロジェクト。パッケージ導入・カスタマイズに加え、HubSpotをはじめとする他システムとのAPI連携等も行います。プロジェクトを牽引し、PL業務全般を専任でお任せできる方を募集。', 'プロジェクトリーダー（PL）としての実務経験（3年以上）
Java および Oracle での開発経験
上流工程（基本設計・詳細設計）の実務経験（3年以上）
AWS環境でのサービス構築経験
運用保守の設計経験
CMSの導入・カスタマイズの実務経験（※実際の経験が無くても、他で補えるスキル・経験があれば相談可）', 'Drupal または HubSpot の実務経験
性能対策、セキュリティ対策、および評価の経験
CMSを用いたシステムの運用保守経験', '85万円程度', NULL, NULL, '大手町（地方可）', 0, '8月〜　※前倒し検討可', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('VDIサービス基盤設計構築支援（サーバー更改）', 'VDIサービス基盤のプロト環境を昨年提供済みで、今回はWindowsサーバ更改を担当頂きます
本番環境作業、リリース対応による夜間対応の可能性あり
（夜間帯といっても18:30-22時までぐらい）
※今年入ってから1回も夜間対応はありません', 'WindowsServer設計～
Activedirectory更改経験
コミュニケーション', NULL, '700,000円／月※スキル見合い', NULL, NULL, '豊洲', 1, '8月〜', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('金融系フロント開発', 'フロント開発とバックエンド両方ございますが、バックエンドに近い部分の開発が多くなります', '基本設計以降の経験
Reactの経験
Java開発経験3年以上', NULL, '65万-70万（経験年数に応じてスキル見合い）', 65, 70, '六本木', 1, '8月もしくは9月〜長期（単月更新）', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('企業内モバイル端末管理支援業務', '端末管理、ID申請更新対応、資料作成、等々', 'Excelマクロ（関数）or VBA等のご経験', NULL, '～37万円（固定）', NULL, 37, '江坂', 3, '即or9月　～ 中長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('ServiceNow BPMプロジェクト', '予算管理システムの再構築プロジェクトにおけるServiceNow関連業務
・設計、設計支援
・開発
・テスト
・ドキュメント作成
・問い合わせ対応　など', '・システム開発歴　5年以上
・ServiceNow開発経験
・PMやメンバーと、自ら積極的にコミュニケーションを行ってきた経験
・自主的に問題を解決出来るか（サポートはありますが、まずは自身で解決の道を探れるか）', '・顧客とのMTGで、開発状況を説明した経験
・要件定義、設計　経験
・JavaScript経験
・HTML、CSS経験
・DBに関する知識、実務経験', 'スキル見合い', NULL, NULL, NULL, 0, '8月以降　順次募集', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('既存システムの機能改修', '基幹システムのリプレースに伴う作業全般', 'VB．NET
SQL（PL/SQLやストアド経験者が理想）
基本設計〜製造〜テストまで対応可能な方', 'Linux
Biz/Browser
売買系の業務知識', 'スキル見合い（MAX65万程度／140h-180h）', NULL, 65, '本町駅 or 堺筋本町', 2, '9月〜長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手通信キャリア向けF5 BIG-IP導入／運用支援', '・大手移動体通信キャリア向けF5 BIG-IP導入／運用業務
・F5 BIG-IP（主にLTM、ASM、AFM）の設定／運用
・仮想サーバー、プール、モニター、プロファイル設定
・導入、アップグレード、パッチ適用
・ロードバランシング、トラフィック管理
・ネットワーク／アプリケーション接続問題のトラブルシューティング
・ベンダーおよびお客様社内チームとの連携（日本語／英語）', '・TCP/IP、DNS、HTTP/HTTPS を十分に理解していること
・ロードバランシングの概念理解
・VLAN、ルーティングの基本知識
・ファイアウォール／セキュリティポリシーに関する基本知識
・ネットワークに関する2年以上の実務経験
・F5 BIG-IP LTM の実務経験
　もしくは同等ロードバランサーの実務経験
・ネットワーク／アプリケーションレベルでの基本的なトラブルシューティングスキル
・日本語：ビジネスレベル
・英語：ビジネスレベル
・勤怠が安定している方
・お客様、チームメンバーと円滑にコミュニケーションを取り能動的に業務遂行できる方
・積極的に学ぶ姿勢がある方
・改善提案／取り組みができる方', '・Kubernetes／コンテナ／クラウドに関する知識
・Python／Bash 等によるスクリプト作成スキル
・通信キャリア／大規模システム案件経験
・CI/CD または自動化に関する知識', 'スキル見合い', NULL, NULL, '二子玉川（常駐）', 2, '2026年7月1日 ～ 長期予定', '2026-07-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('複数アプリケーションの維持保守および問い合わせ対応', '・担当アプリケーションに関する問い合わせ対応（顧客窓口）
・ログ調査、コードリーディングによる不具合・仕様確認
・既存ドキュメントの整理および不足情報の補完
・運用手順の確認および改善提案
・JP1を用いたジョブ運用の確認・対応', '・AWS環境での開発または運用経験
・JavaおよびBashの実務経験（コード読解可能レベル）
・JP1の運用経験
・複数システムを横断した運用・保守経験', '・Redmineの使用経験
・ログおよびソースコードからアプリケーション挙動を推測できる能力
・ドキュメント不足環境下での調査・整理経験
・顧客とのコミュニケーション経験（問い合わせ対応、説明対応等）', '〜60万（清算幅 固定）', NULL, 60, '中之島周辺', 3, '8月〜', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手小売業のデータ抽出支援', '大手小売業が保有しているクレジットカード会員向けのキャンペーン対象者の抽出、稼働促進DM送付対象者の抽出をしていただきます。営業に関わる抽出依頼や定例抽出作業がメインになります。', 'SQLの実務経験（多少複雑なSQLも作成できること）
→2年レベルは欲しいです
VBAの実務経験
新しい技術を前向きな姿勢で対応できること', NULL, '～45万（上振れは応相談）', NULL, 45, '神保町（常駐）', 2, '8月～', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手ロボット企業の品質管理・実機検証業務', '大手ロボット企業の調理ロボットに関するQA業務全般。開発フェーズではなく、実際の運用やハードウェアに直接触れる実作業（ソフトウェア検証、テスト実行、ハードウェアの受け入れチェック、不具合調査、品質管理サポート等）がメインとなります。', '・社会人経験（1〜2年程度。新卒も検討は可だが単価要相談）
・基本的なITリテラシー（チャットツール等の活用に抵抗がないこと）
・受け身ではなく、状況に応じて主体的に動けるコミュニケーション能力
・個人でなくチーム全体での連携や行動ができる方
・倉庫への通勤が問題ない方', '・IT業界でのQA業務経験
・ハードウェアや組み込み機器に触れた経験
・英語などの語学力', '35〜37万円', 35, 37, '有明＋東葉高速線八千代緑ヶ丘駅からバス20分。物品の入荷状況に応じて八千代市の倉庫の頻度が上昇', 1, '9月〜長期（※最低でも1年以上の継続勤務を想定）', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('遊戯機器向け新サービス／店内サーバアプリケーション機能追加検討対応', '開発工程以降の対応
各種試験対応
環境キッティング対応
各種ドキュメント作成
現行アプリケーション維持作業をお願いする場合あり', 'C# 、Ｃ、Ｃ++でのWEB開発経験（組み込み、ゲーム系はNG）
チーム内でコミュニケーションを取りながら作業できる方
Word／Excel／PowerPointで資料作成可能
※Excelは関数を用いた計算・集計ができること', 'Windowsアプリ開発経験
Webクライアントアプリ開発経験
要件定義経験
外部設計・内部設計経験（外部設計経験が望ましいが内部設計からでも可）
ウォーターフォール経験', '45～65万円程度（経験により）', 45, 65, '豊洲', 2, '9月～長期予定
10月～', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Java2案件 案件1', 'inspirX（CRMパッケージ）開発支援。作業工程：詳細設計、実装、単体テスト、結合テスト、システムテスト、本番リリース、保守対応（仕様QA、調査）のフェーズを担当。', '①Javaとフレームワークを用いたWebアプリケーションの開発経験者（上級ＰＧ）
②詳細設計～開発～結合テスト迄の一連作業が対応可能な方
③年齢：45歳前後迄', NULL, '67万円前後（スキル見合い：精算有り140h-180h）', NULL, NULL, '神谷町', 1, '即日又は、9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Java2案件 案件2', '国内融資システム更改（融資アーキ案件）。現在のシステムを新しいアーキテクチャで更改。担当領域はアプリケーション部分（画面、バックエンド）。作業工程：基本設計又は、詳細設計～詳細設計～開発～結合テスト、システムテスト。', '①Javaのバックエンド、フロントエンドの開発経験者をそれぞれ募集いたします。
Javaのバックエンド側の開発経験者（開発経験5年以上）：2名
JavaScriptのフロントエンド側の開発経験者（開発経験3年以上）：2名
②基本設計又は、詳細設計～開発～結合テスト迄、一連作業が可能な方
③年齢：50歳前後迄', NULL, '～67万前後迄（スキル見合い：精算有り140H～190H）', NULL, 67, '中野', 1, '9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('損害保険／システム保守、開発', '団体、請求精算、代理店データ提供', 'COBOL（汎用機）
日立マシン経験
勤怠面問題ない方', '損保経験
保守経験
請求精算業務
管理能力', '～50万（スキル見合い）', NULL, 50, '大江戸線 光が丘より徒歩15分 または 有楽町線 地下鉄成増よりシャトルバス10分', 1, '2026年9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('システム運用監視支援', '運用監視、アラートの設定、設計、運用テストをメインでご対応いただきます。', 'システム開発全般（要件定義～運用保守）の経験があり自発的に推進できる方
維持運用業務の経験があり電話やメールなどでの顧客応対ができる方
コミュニケーションに問題がなく、主体的に業務推進できる方', NULL, 'スキル見合い（160-180h）', NULL, NULL, '京橋', 2, '8月～', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('金融機関向け学務情報統合システム インフラ設計・構築', '金融機関向け学務情報統合システムにおけるインフラ基盤の設計・構築案件です。Windows Server環境を中心に、RDS・VDI・Active Directoryなどのミドルウェア設計・構築からテスト、運用設計、ドキュメント作成までを一気通貫でご担当いただきます。', 'Windows Server（OS / Hyper-V / Active Directory）の基本設計以降の実務経験
RDSおよびVDIの基本設計以降の実務経験
基本設計から検証、構築、試験、運用設計、ドキュメント作成までを一人称で対応できる方
岩手県への短期出張（構築・テストフェーズにて約1週間）に柔軟に対応できる方', 'VPCC（VirtualPCCenter）およびSSC（WebSAM SigmaSystemCenter）の基本設計以降の実務経験
プロキシサーバ（リバースプロキシ含む）の基本設計以降の実績
ESXiに関する知見・実務経験（※検証環境として利用のため）
プロジェクトマネジメント補佐（PMO/リーダー）の経験
PrismAccess（ゼロトラストソリューション）の設計・構築経験', '70万円 〜 75万円（スキル・経験見合い）', 70, 75, '西新橋（構築・テストフェーズにおいて岩手県へ約1週間の出張あり／出張費精算可）', 1, '即日 ※ 約1年間（長期予定）', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('サーバ運用保守', 'サーバ運用業務　・問い合わせの2次対応', 'サーバ運用のご経験（Linux、Windows）
コミュニケーション能力、主体的に取り組める方', 'ハキハキとした元気な若手希望です。
勤務時間は9：00〜17：45
交代要員の募集です。', 'スキル見合い（140−180H）', NULL, NULL, 'JR灘（または阪神岩屋）', 1, '8月〜', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('公共系保守案件', NULL, '開発経験
＊ツールでの開発になるため、言語は問いません', '保守のためシフト（土日祝は休み）勤務（各シフト7日程度）
早勤：8：30〜17：30
通常：9：30〜18：30
夜勤：14：00〜23：00', '37万程度（140-190H）', 37, 37, '堂島・大阪駅', 2, '10月〜長期', '2026-10-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('生産・販売・財務管理システム開発業務', '保守運用業務全般　問い合わせ・システム改善など', 'VB.NET、Accessのご経験
システム保守業務経3年以上
自身のタスク管理ができること
システム改善の工程の理解、実務経験（設計〜リリース）
コミュニケーション能力、主体的に動けること', '9：00〜17：30（12：00〜12：45　休）
＊1泊程度の出張がまれにあります
＊単価感からも若手想定です', '45万程度（140-180H）＊交代のため', 45, 45, '南茨木駅（阪急・モノレール）', 1, '9月以降〜　長期
＊交代のため参画時期は相談、
初月引継ぎ期間の単価相談可能な方のみ', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手金融機関　証券システムの再構築', '現行システムからの再構築案件
テスト結果のインシデント対応、設計書の修正', 'C#の開発経験（3年以上）
WEBアプリ（ASP.NET）の開発経験（3年以上）
Oracle（現行システム）、SQL Server（次期システム）いずれかの開発経験（3年以上）', 'Windows PowerShell開発経験者
証券業務知識は不問だが、株式、債券、投資信託、先物取引等の基礎知識があれば尚可', '65万程度　スキル見合い', NULL, NULL, 'フルリモート（昭島）', 0, '2026年9月～中長期想定', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('組合向けの管理システム', '設計以降を対応いただきます。詳細は面談にお伝えします。', 'WEBアプリケーションの開発経験3年以上
TypeScript（Next.js）におけるFE+BEの開発経験
フル出社が問題ない方
コミュニケーションが問題ない方
Claude CodeやCursorなどのAI活用経験', 'Laravelでの開発経験', '80万', 80, 80, '新宿（フル出社）', 2, '8月or9月希望', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('自動倉庫管理システム開発', 'お客様の要望に合わせて自動倉庫管理システム（パッケージ製品）のカスタマイズを行う。画面、IF、API（ロボットとの連携など）など全般に設計業務から開発、テストまでを実施', '基本設計以降の業務経験
PHP(Laravel)のWEB開発経験
MySQL', NULL, 'スキル見合い ご提示ください', NULL, NULL, '大阪市内（弊社顧客内）', 1, '８月or９月〜半年程度　延長の可能性あり。', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('計測装置を制御するソフトウェア開発【C#,C++／西大路駅】', '計測装置を制御するソフトウェア開発', 'C#もしくはC++での開発経験
組み込みの経験', '基本設計の経験', 'スキル見合い（160‐180h）', NULL, NULL, '西大路駅', 2, '9月～長期予定', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('統合DBシステム：SQL開発（リーダー枠）', NULL, 'SQL、Shell開発経験5年以上
基本設計から一人称で対応可能な方
チームリーダー経験
コミュニケーション能力 ※重要', 'Linux、JP1、HULFT経験
バッチ作業経験', 'スキル見合い（65～75万目安）', 65, 75, 'JR新川崎駅', 1, '2026/9～', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手企業のサイバーセキュリティ体制強化に伴う、セキュリティコンサルティング及びシステム運用保守業務', '・社内セキュリティ関連全般相談対応
　→関係部署との調整及び施策推進支援（PMO機能）
・インシデント管理・分析・対応
　→事故対応手順、復旧手順の整備
・セキュリティガイドライン、規程の策定、運用対応
・SSE（Security Service Edge）社内展開・機能実装・定常運用対応支援
　→エージェント社内展開支援
　→各種ポリシーの管理並びに実装
　→ブラウザ分離機能、DLP機能、CASB機能導入検討と実装
・上記業務に付随して、
　→課題洗い出し
　→情報資産管理
　→対策検討（優先順位、スケジュール検討、マニュアル作成等）', '・セキュリティガイドライン、規程の策定、運用経験
・インシデント対応経験またはCSIRT構築経験
・ステークホルダーとのコミュニケーションスキル及び協調性
・NW機器運用知識並びにProxyサーバ、Firewall、VPNサーバの運用経験
・中・大手企業でのサイバーセキュリティ関連業務経験
・上位層向け報告書作成スキル', '・社内教育関連業務の経験
・業務ストレージ運用経験またはバックアップ作業等の経験・知識
・グローバル拠点との業務連携実績', '90万～130万（応相談）', 90, 130, '中野駅', 2, '8月～', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Webシステム開発支援（PHP）', NULL, 'PHP・Laravel　実務経験3年以上
WEBシステム　業務システム　実務経験5年以上
基本設計（詳細設計除く）の実務経験3年以上', NULL, 'スキル見合い※参考60万～62万円程度', 60, 62, '江坂', 1, '8月or9月～長期予定', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('セキュリティ方針・ガイドライン策定支援', 'セキュリティ規程・ガイドラインの現状調査
ギャップ分析
整備方針の策定
ロードマップ作成
顧客との打ち合わせ・資料作成', 'セキュリティガバナンスに関する知見
セキュリティポリシー・規程・ガイドライン策定経験
ISO27001またはNIST等のフレームワーク知見
セキュリティ戦略・ロードマップ策定経験', '顧客折衝・ヒアリング経験
課題整理・分析経験
PowerPointによる資料作成経験
セキュリティ戦略・ロードマップ策定経験
コンサルティングファームまたは同等のプロジェクト推進経験
自走して業務を推進できる方
高いコミュニケーション能力', '完全スキル見合い', NULL, NULL, '永田町', 1, '8月中旬～（応相談）', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('SOC運用設計・高度化支援', 'SOC運用設計
SOCの役割・責任整理
平時・有事運用プロセス設計
変更管理プロセス整備
運用ガイドライン作成', 'SOC運用設計経験
SOC成熟度評価経験
CSIRT・インシデント対応プロセスの知見
SOC高度化・ロードマップ策定経験', '顧客折衝・ヒアリング経験
課題整理・分析経験
PowerPointによる資料作成経験
セキュリティ戦略・ロードマップ策定経験
コンサルティングファームまたは同等のプロジェクト推進経験
自走して業務を推進できる方
高いコミュニケーション能力', '完全スキル見合い', NULL, NULL, '永田町', 1, '8月中旬～（応相談）', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('セキュリティ対策評価制度（SCS）アセスメント支援', 'SCSアセスメント実施
証跡確認
ギャップ分析
改善計画策定支援
顧客への改善提案', 'セキュリティアセスメント経験
NIST CSF v2.0またはISO27001等の知見
ギャップ分析・改善計画策定経験
サプライチェーンセキュリティの知見', '顧客折衝・ヒアリング経験
課題整理・分析経験
PowerPointによる資料作成経験
セキュリティ戦略・ロードマップ策定経験
コンサルティングファームまたは同等のプロジェクト推進経験
自走して業務を推進できる方
高いコミュニケーション能力', '完全スキル見合い', NULL, NULL, '永田町', 1, '8月中旬～（応相談）', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('【フルリモート】SaaSプロダクトにおけるフルスタックエンジニア（TypeScript / Next.js / Hono）', 'PLG型のSaaSにおいて、フルスタックエンジニアとしてプロダクトの開発・改善をご担当いただきます。プロダクトマネージャーやデザイナーと密に連携し、仕様検討からフロントエンド・バックエンド双方の実装、リリースまで一貫して牽引していただくポジションです。', 'TypeScript を用いたフルスタックなWebアプリケーション開発の実務経験（目安3年以上）
チーム開発において、仕様を深く理解し主体的に実装・開発を推進した経験
既存コードの改善や継続的なリファクタリングを行いながら開発を進めた経験', 'Hono を用いたAPI開発・運用経験
API設計およびバックエンドと親和性の高いフロントエンド実装経験
CQRS + Event Sourcing アーキテクチャへの理解や開発経験
パフォーマンス改善やプロダクトの安定性向上に取り組んだ経験
toB向けSaaSやスタートアップ／成長フェーズにおけるプロダクト開発経験', 'スキル見合い（時給精算）', NULL, NULL, '基本リモート（フルリモート）等', 0, '随時～長期', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手生命保険会社向け システム開発支援', '大手生命保険会社における「新契約」領域のシステム開発およびオフショア開発の受入・管理業務
・新契約システムにおける基本設計・詳細設計および仕様検討
・オフショア開発チーム（海外開発拠点）への業務指示、納品成果物の受入確認・レビュー
・オフショアチームとの課題調整、進捗管理および品質確認', '・COBOLを用いたシステム設計（基本設計・詳細設計）の実務経験
・生命保険業界における業務知識
・オフショアチームや関係各所とスムーズに連携できる高いコミュニケーション能力', '・オフショア開発（海外拠点）での受入検証、ブリッジ対応、管理経験
・大型保険システム改修プロジェクトにおける参画経験', '～60万（スキル見合い）', NULL, 60, '春日', 3, '2026年10月 ～ 長期想定', '2026-10-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('製造業向けデータ基盤構築', 'SAPを基幹システムとして周辺システムのためのデータ基盤構築、および、レポートを提供する開発案件
作業工程：要件定義、開発、移行○データ移行対応
テーブルの設計、レポート開発作業', '・SQL
・テーブル設計
・レポート設計
・DatabricksまたはAzure Data Factory（ADF）の経験', '・ETLツールの開発経験
・Power BI', '70万前後（スキル見合い）', NULL, NULL, NULL, 1, '2026年8月～', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Windowsサーバ基盤更改・クラウドリフト支援', 'オンプレ上WindowsサーバをAzure上へ移行
OS更改（Windows Server 2016 → 2022/2025）含む', 'サーバ設計
サーバ構築（監視設定）
※Azure、zabbix、JP1を使用
→zabbixやJP1を使って監視業務のご経験ではなく、設定や構築の経験がある方を募集しております。', 'VMWareでのサーバ構築
クラウドでの監視構築経験
テストシナリオ作成
Veeamの知識', 'ご提示ください', NULL, NULL, '梅田またはリモート', 1, '2026年9月頃～11月頃（延長の可能性あり）', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('保険会社様向けシステム開発（ＰＭ業務）', '新商品対応などの保守開発におけるＰＭ業務', 'システム開発におけるマネジメント経験(3年以上)
WBS作成経験
進捗管理経験
各種タスクの作業プロセス整理
（プロジェクトルール・過去事例の調査を含む）
仕様変更・遅延リカバリ等への対応計画立案
上記に関する発注元リーダとの調整', 'Azure、Oracle、Javaの技術保有者', 'スキル見合い（ご希望単金をご提示下さい）', NULL, NULL, '大崎', 1, '2026年8月 〜 ※7月中の参画も応相談', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('アーティストのEC運営スタッフ or オンラインくじ企画・運営スタッフ', '適性に合わせて公式オンラインストア（ECサイト）またはオンラインくじの企画・運営を担当（窓口業務、予算管理、データ分析・管理、物流調整、ディレクション等）', '（1）業務面スキル
以下のいずれか「1つでも当てはまる」方（経験浅い方もOK）
・Web業界での業務経験（職種不問）
・エンタメ業界での業務経験（職種不問）
・ディレクション業務の経験（業界不問）

（2）人物面スキル
・音楽やエンタメが好きな方
・コミュニケーションスキルに自信のある方
・マルチタスクが得意な方
・チームワークを大切にできる方
・主体的に考えて行動に移せる方
・繁忙期（月10〜20時間程度残業）の業務負荷に対して、柔軟に対応できる方', '・ECサイトに関する業務経験
・物流業務に関する業務経験
・オンラインくじサービス関連の業務経験
・商品・ノベルティー等の製作ディレクション経験（商材不問）', 'スキル見合い（MAX40万想定）', NULL, 40, '渋谷', 2, '即/9月〜長期', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('某キャリア向けweb開発（Typescript）', '・WEBアプリのバックエンド開発。
・GCP上で構築。
・開発言語はTypeScriptを想定
・要件定義から開発まで基本的に実施想定。レビューは顧客側にて実施。
・顧客や対向システムとのIF仕様調整', '全枠共通：顧客や対向システムとの折衝のためコミュニケーション良好な方
WEBアプリ開発担当
TypeScript（JavaScript可）実務経験4年程度
要件定義〜基本設計経験
※顧客・対向システムとのIF仕様調整を伴うため、要件定義段階からの参画経験を想定
※顧客レビュー前提のため、API設計書・DB設計書・IF定義書等を自ら作成し文書化できる力を含む', 'Claude Code／GitHub Copilot等の生成AIを活用した開発経験
GCP（Cloud Run／Cloud Build／Cloud Storage等）でのクラウド環境における開発・運用経験
Node.js（NestJS等のフレームワーク）によるAPI開発経験
Prisma等のORMを用いたRDB（PostgreSQL）設計・実装経験、負荷やレスポンス速度、メンテナンス性を考慮したテーブル設計ができる方
BullMQ/Redis等を用いた非同期ジョブ・バッチ処理の設計・実装経験
モバイルアプリのサブスクリプション課金基盤（Apple/Google決済API等）の実装経験
Firebase Authentication等の認証基盤を用いた開発経験
Jestによる単体テスト・E2Eテストの実装経験
コードレビューや品質向上（テストと本番コードの整合性を含む）を意識したチーム開発経験
Go言語での開発経験（SSEサーバー等の関連モジュールを想定）
GitHub Actionsを用いたCI/CD経験
Jira/Confluenceを用いたアジャイル開発経験', '75万前後 スキル見合い', NULL, NULL, '渋谷（テレワーク主体）地方不可', 1, '2026年9月〜長期前提', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('派遣領域インフラ基盤の運営・管理（テクニカルPMO）', 'DevOps/マイクロサービス基盤の運営
チーム内および関係部署との調整、スケジュール管理
会議体のファシリテーション
タスク管理、進捗管理
課題管理、リスク管理および解決推進
Kubernetes基盤の運用支援
Azure DevOpsを活用したリリース/CICD運用支援
システム監視、障害対応およびエスカレーション管理
運用改善、自動化施策の推進
運用ドキュメントおよび各種報告資料の作成', '1．プロジェクト推進スキル
→タスク管理能力
→課題定義・課題解決能力
→ファシリテーション能力
→ステークホルダーとの調整・コミュニケーション能力

2．DevOps・クラウド技術スキル
→Azure DevOPsを用いたCI/CDに関する基本知識
→Azureクラウドサービスに関する基本知識
→Kubernetesを中心としてマイクロサービスアーキテクチャの理解
→コンテナ技術（Docker/Kubernetes）の基本的な運用知識

3．インフラプラットフォームスキル
→ネットワークに関する基礎知識（TCP/IP、HTTP/HTTPS）
→Load Balancerに関する基礎知識
→DNSに関する基礎知識
→Linux環境における基本的なオペレーションスキル
→PostrgreSQLに関する基礎知識', '・アジャイル開発プロジェクトにおけるPM/PMO経験
・Openshiftの導入・運用経験
・Azure DevOpsを利用したCI/CDパイプライン設計・構築経験
・Kubernetes、Dockerなどコンテナ技術の実務経験
・PostgreSQLの運用・パフォーマンスチューニング経験', '～150万円', NULL, 150, '末広町駅または秋葉原駅', 1, '各Qの開始月想定（現時点では10月～）※前倒し不可', '2026-10-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('化成品メーカー向けJavaバージョンアップ対応', 'Javaシステムのバージョンアップ案件です。Java11からJava17へのバージョンアップをご担当いただき、Mavenの依存関係を考慮しながら影響調査・改修をご対応いただきます。2027年3月までJavaのバージョンアップを実施し、その後はAngularのバージョンアップ対応へスライド予定となっております。', 'Javaのバージョンアップ経験
一人称で対応可能な方
Java開発経験10年程度', 'Java11→Java17へのバージョンアップ経験
Mavenによる依存関係管理経験
Angular経験
影響調査経験', 'スキル見合い', NULL, NULL, '大森', 1, '2026年9月～2027年3月', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Azureデータ連携システム構築支援', 'Azure環境におけるデータ連携システムの構築プロジェクトにご参画いただきます。', 'Azureでの基盤構築経験', 'PythonまたはC#での開発経験
以下いずれかの利用経験
- Microsoft Fabric
- Azure Data Factory
- Microsoft Power Platform', 'スキル見合い', NULL, NULL, '大阪天満宮駅／南森町駅／天満駅', 1, '8月〜 または 9月〜（長期予定）', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('上位システム（駅務）開発案件', '既存チームに加わり、C#やPL/SQL（Oracle）を用いた開発業務を担当いただきます。
作業工程：詳細設計、開発、検証', '- C#、Oracle（その他DBも可）などの開発経験3年程度', '-バッチ作成、FTP、OracleDB構築', '時給精算', NULL, NULL, 'JR野洲駅', 1, '2026年9月 〜 12月を予定', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('人事系ワークフローシステム/給与システムに係わるヘルプデスク業務', 'ヘルプデスク担当
仕様書読み取り、ソース解析（ソースはできれば可）', '製造工程の経験があり、仕様を理解した上で主体的に開発・テストを推進できる方
維持運用業務の経験があり電話やメールなどでの顧客応対ができる方
コミュニケーションに問題がなく、主体的に業務推進できる方', 'Java(Web)、PL-SQL、Pythonの開発経験がある方
人事給与システムに知見のある方
Oracle EBS、intra-mart、Accel Platform保守・開発経験者経験のある方', NULL, NULL, NULL, '京橋', 2, '2026/08中旬以降', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('銀行情報系DWH再構築案件', '稼働中のDWHを統合、再構築する案件。現在要件定義工程中。', 'Snowflakeの経験:4年以上', 'Python、AWS環境での開発経験', 'スキル見合い', NULL, NULL, '品川シーサイド', 2, '2026年8月〜（9月、10月以降可、など調整可能）', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('保険業様向けETL開発者（Informatica Power Center/CDI-PC、シェルスクリプト）', '変革プロジェクトの実行および業務効率化を推進する取り組みとして、Informatica PowerCenter（またはCDI-PC）およびシェルスクリプトを活用したETL・バッチ処理の開発・保守・運用を担当。顧客や関係者と連携し、データ連携基盤の改善、自動化推進、データインターフェース戦略の立案・実行を推進。', 'Informatica PowerCenter、CDI-PC（Cloud Data Integration for PowerCenter）等を利用したデータ連携開発
Linux Shell Script開発
日本語：ビジネスレベル（読み書き・会話）
英語　：ビジネスレベル（読み書き・会話）', 'アジャイルデリバリーモデルの経験
保険（生命保険・損害保険）または金融サービス分野におけるソフトウェア開発ライフサイクル（SDLC）の知識と実務経験。', '60万', 60, 60, '白金高輪駅', 1, '2026年8月3日', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('商品マスターのメンテナンスシステム開発', '商品マスターのメンテナンスシステム開発', '要件定義〜設計〜製造〜テストの全行程が出来る方
AWSサービスを利用してアプリ開発が出来る方
C#.Net
AmazonAurora（PostgreSQL)
Angular 18.2、KendoUI 16.11（またはJavascript）', NULL, 'スキル見合い(140-180h)', NULL, NULL, '弊社内', 1, '9月（8月中も可）から27年1月（以降継続の予定）', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手小売り向けサーバ運用支援（インフラ）', '大手小売り向けのPOSレジおよび関連サーバの設定作業を担当。リモート環境でのPOS設定作業のほか、店舗向け業務PCへのアプリケーションインストール作業を実施。長期的な運用・保守業務を担当し、安定したシステム運用を支援する。', '・システム運用または保守経験（3年以上）
・PC設定、アプリケーション導入経験
・円滑なコミュニケーション能力
・夜勤対応可能な方（月3〜4日程度）
・長期案件のため1年以上の就業経験ある方', '・POSシステム運用経験
・Windowsサーバ運用経験
・小売業向けシステムの運用経験', '〜50万円（上振れはスキルにより応相談）', NULL, 50, '海浜幕張（初月のみ出社、その後リモート予定）', 1, '2026年8月〜長期', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手銀行様向けJava開発（日本基準・IFRS対応）', '詳細設計～結合テストまで（日本基準対応で構築した機能をベースとした修正・拡張開発が中心）', 'Java詳細設計以降を一人称で対応可能なレベル', NULL, 'スキル見合い', NULL, NULL, '新祝園駅よりバス10分', 3, '9月又は10月～', NULL, NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('クラウドサービス プリセールス初期提案業務', '①営業支援
・プリセールス活動,営業的業務
②技術支援
・技術的ドキュメント作成支援,データ分析,技術支援
③初期提案支援
・Azureサービスの初期提案,
・システム基盤 構築・試験・リリース対応
・導入簡易化,ソリューションパッケージ化による販売
・提案案件個別検証,各検証のドキュメント作成', 'Azure 設計,構築経験
Windowsサーバ 設計,構築経験
MS製品 設計経験
Intune,GPOなどのユーザデバイス制御 設計,開発経験', NULL, 'スキル見合い', NULL, NULL, '新宿(リモート併用) ※頻度不透明のため出社に抵抗ない方を望', 1, '即日～長期', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('NW機器(無線APやルータ/スイッチ)などのNW構築,機器設置等', '某外資系ラグジュアリーお客様で、NW機器の更改や交換対応があり、Cisco機器やJuniper機器でのNW構築、運用保守、サポート対応等をご担当いただきます。
主に以下のNW業務をご担当いただきます。
・Router,Switch,AP,FW(主にCisco,Fortigate製品)関連の対応
・ユーザとのメール,電話,チャット,対面でのヒアリング,打合せ参加
・店舗オンサイトでの機器確認/交換/追加作業実施
・Config作成、事前キッティング、CLI/GUIでの設定対応
・パラメータシートや試験書、手順書などのドキュメント作成
・打合せ,現地作業立ち合い,ベンダ調整対応等
・簡易的なLAN配線作業,ケーブル結線/整線作業', 'ネットワーク構築経験1,2年以上
Cisco製品などのNW機器操作経験,Config作成経験', 'AP(Cisco(Meraki),Aruba製品など)交換経験
英語ビジネスレベル以上
ベンダー調整経験', '45～65万円程度スキル見合い', 45, 65, '銀座一丁目', 2, '即日(9月可)～長期', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('インフラ構築支援案件', '詳細は面談時の開示とさせて頂きますが、下記募集枠で要員を探しております。
①AnsibleにてPlaybookを作成
②LifeKeeper設計', '募集枠①
AnsibleにてPlaybookを作成した経験があること
Red Hatの設計・構築経験があること
募集枠②
AWSに精通していること
LifeKeeperでの設計経験があること', NULL, 'スキル見合い', NULL, NULL, '天王洲アイル(週3テレワーク予定)', 1, '即日～11月末まで(評価が良い方はスライドを検討)', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('在庫管理システム', '製造工程', 'Java開発4年～5年以上
webperformer経験', NULL, 'スキル見合い', NULL, NULL, '天王洲アイル(基本常駐、状況によってはリモート相談可)', 2, '9月～11月末 ※延長の可能性あり', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('ITシステム群の構築・移転', '既存の部品表システムにおける移転業務を担当。
OSおよびアプリケーションの稼働環境整備、DBやファイルなどのデータ移行作業を行う。', 'インフラ導入またはサーバ設計・構築経験5年以上
Windows,Linuxを用いたOS,コマンド,Shellの操作経験
Oracleの環境設定経験
robocopyなどを用いたファイル移行の経験', 'InterStageなどを用いたWebアプリ環境整備経験
Zabbix経験', 'スキル見合い', NULL, NULL, '関内または鴨居(常駐)', 2, '即日～長期', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('金融業界向けAWS案件', '金融業界の高いセキュリティ基準(FISC安全対策基準など)に準拠した、AWSマルチアカウント環境の設計・構築・運用、およびガードレール(SCP等)の適用。
合わせて、GitHub等の開発プラットフォームにおける組織管理やCI/CDの標準化を推進していただきます。
・AWS Organizationsを用いたマルチアカウントの統制管理(SCPの設計・検証・適用)
・各種セキュリティ・監査ログの集約および監視基盤の運用(CloudTrail、GuardDuty、Security Hub等)
・GitHubのOrganization/マスターアカウントの管理・運用(ポリシー設定、アクセス権限管理、CI/CD環境の整備)
・金融水準のセキュリティ要件に基づくインフラコード(IaC: Terraform等)のレビューおよび展開', 'AWS環境におけるインフラ設計・構築・運用の実務経験
AWS Organizationsを用いたマスターアカウントの管理・運用経験(SCPによる制限・ガードレール設計の知識)', NULL, 'スキル見合い', NULL, NULL, '六本木(週3,4リモート)', 1, '9月～中長期', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('金融系大規模システム更改PJ', '現行システムの IBM WebSphereから Tomcatに移行予定。移行に伴い、検証,設計,構築～リリースまでご対応いただきます。2030年にリリース予定のため、長期でご対応いただきます。', 'Linuxサーバの設計,構築経験5年以上
Tomcat移行経験', NULL, 'スキル見合い', NULL, NULL, '豊洲', 2, '即日(9月可)～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('某企業向けシステム Hyper-V移行案件', '現行のVMwareのサポート切れに伴うHyper-Vへ移設作業
※基本設計,詳細設計,UT,IT,各種ドキュメント作成', 'Hyper-Vの設計,構築経験', 'VMware(現行の設計理解の為)
IBM Spectrum Protect(VMのバックアップに利用しているため)
IBM Cloudの作業経験(IBMCloud上での構築となるため)', 'Max75万円
※必須、尚可すべて経験ありの場合、満額可', NULL, 75, '基本リモート(月1.2日仲町台)', 1, '即日(9月可)～長期', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('基幹システム保守開発案件', '生保会社の基幹システムの保守開発を担当。
サブシステム(請求系)の保守開発か新規の保守チームにアサイン予定。
弊社上位会社のリーダーの下部に増員メンバーとして参画想定。', 'COBOL開発経験(IBM尚可)
生保関連PJ参画経験', NULL, 'スキル見合い', NULL, NULL, '錦糸町(週1回程度の出社)', 1, '9月～長期', '2026-09-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('官公庁システム_保守', '官公庁業務システムおよび端末群に対する現地常駐型の運用保守サポート', 'Java開発経験
問合せ対応含むシステム保守経験5年以上', NULL, 'スキル見合い', NULL, NULL, '浦和', 2, '9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('通信キャリア/補償サービス向けPMO', '補償系サービスにおける以下作業を担当
・各種システム更改／開発調整
・コンタクトセンターのシステム移行／開発調整
・運用保守支援、問い合わせ対応
・開発調整、開発管理、ベンダーコントロール
・技術調査、技術検証
・定例会参加、議事録作成 など', '通信キャリアにおけるサービス主管部門でのPMO経験
ファシリ、議事録作成担当ではなく、要件定義などの技術寄りPMO経験者
小規模プロジェクトを主体的に推進してきた経験', NULL, 'スキル見合い', NULL, NULL, '基本リモート(出社時は溜池山王)', 1, '即日～長期', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('スマホアプリ(Flutter,Dart,Kotlin)テックリード案件', '某社ネットコンビニアプリ(エンドユーザー向け,店舗向け)の開発工程を実施。', 'Claudeを用いた開発のご経験
開発,テスト設計書のレビュー経験者
Flutter開発のご経験3年以上', NULL, 'スキル見合い', NULL, NULL, '基本リモート(四ツ木)', 1, '9月～長期', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('【PjM】AI領域におけるプロジェクトマネージャー募集案件', 'AIに関わる導入コンサルティングやプロダクトを提供しているエンドにて、専任プロジェクトマネージャーとして、各開発案件のプロジェクトマネジメントをして頂きます。
・戦略・上流工程
 - クライアントの業務理解・課題特定：お客様の業務フローに深く入り込み、お客様自身が言語化できていない潜在課題を見抜く
 - AX戦略・ロードマップ策定：AI活用の全体戦略を描き、段階的な導入計画を提案
 - 提案活動・営業同行：案件獲得に向けた提案書作成、顧客へのプレゼンテーション
・プロジェクト推進
 - 要件定義・仕様策定：PRD／要件定義書／仕様書の作成、顧客との合意形成
 - プロジェクトマネジメント：開発チーム（社内外）のマネジメント、スケジュール・品質・コスト管理
 - 顧客折衝・リレーション構築：継続案件・拡大案件につなげる信頼関係の構築
・技術検証・ハンズオン
 - 技術検証・プロトタイピング：生成AIの技術検証やプロンプトチューニングなど、自ら手を動かしての検証
 - 報告書・ドキュメント作成：顧客向け報告書、プロジェクト進捗レポートの作成', '・下記いずれかがある方
（１） 上流ポジション（PMやコンサル, PdM等）且つ エンジニアとしてのご経験
（２） Dify等のLLMオーケストレーションツールを使用したPoC推進のご経験

・共通
　- 顧客課題をヒアリングし、要件やプロトタイプへ落とし込んだ経験
　- AI領域に関する実務経験 もしくは 興味関心', NULL, '〜140万円程度', NULL, 140, '西新宿', 1, '随時〜', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('航空系販売予約システムにおける品質強化支援（メンバー枠）※Java', '航空券販売に関連するシステム群（50以上）を管轄する販売予約チームにて、開発エンジニアを募集しております。Javaを中心としたバックエンド開発および保守運用を担当いただきます。品質向上施策や既存システムの改善にも携わっていただくため、主体的に業務を推進できる方を求めています。', 'Javaによるバックエンド開発経験
設計以降の開発経験
運用保守経験（保守フェーズからの参画経験があれば尚可）
AWS実務経験
（AWSサービスを利用した開発経験）
（CloudWatch等を利用したログ運用経験）
経験年数10年以上
未経験の言語／技術要素についてキャッチアップする意欲', 'AWS認定資格保有
AWS環境構築経験
要件定義経験
AI駆動開発（GitHub Copilot等）の経験
AI開発経験または知見
SQLチューニング経験', '～75万円/月　※スキル見合い', NULL, 75, '新整備場駅', 1, '2026年9月～長期', '2026-09-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('品質管理・プロセス策定リーダー（PMO / テックリード）', '品質管理プロセスの策定、およびテスト推進・ルール作りを実施。Excel管理からMarkdown/Gitを活用したモダンなドキュメント一元管理への移行・ルール策定や、PMと現場間の仕様調整・ファシリテーション、各種ドキュメントの作成・レビュー・標準化を担当。', 'システム開発経験、または上流（要件定義・基本設計）の経験
Git（GitHub / GitLab）を用いたドキュメントやコードの管理経験
リーダー経験、またはプロジェクトの進行管理・調整経験
フワッとした要件や散在する資料を、テキスト（Markdown等）で論理的に構造化してまとめるスキル
立場や意見の異なる関係者の間に入り、円滑に合意形成を主導した経験', 'Excel管理からMarkdown/Git等への移行・刷新経験
テスト設計・QAプロセスの構築経験
Confluence、Wiki等のナレッジ共有ツールの活用経験', '650,000円/月程度', 65, 65, '新橋、内幸町近く', 1, '即日〜', NULL, 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Web開発向けPHPエンジニア', '国内最大級のエンタメ系Webサービスを展開するエンド企業にて、新規立ち上げサービスのサイト開発に従事。', '・PHP（Laravel）を用いたWebアプリケーション開発経験5年以上
・システム負荷やセキュリティを考慮した開発経験（大量アクセスに耐えられる、安全なサイトを作った経験）
・チームでの開発経験
・toC向けサービス開発経験', '・Linux、HTTP、SQL、RDBMS、JavaScript、KVSに関する知識
・AWSを利用したシステム構築・運用経験
・パフォーマンスチューニングや負荷対策の経験
・Reactを用いたフロントエンド開発経験
・インフラ領域の知識・経験
・大規模Webサービスの開発経験', '〜65万円', NULL, 65, 'フルリモート（初日のみ渋谷）※地方可', 0, '9月1日（もしくは9月16日）〜長期想定', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('認証システム開発案件', '部品や資材の発注、設計書などのコアな情報を仕入れ先と連携する際の認証システム開発。9月から詳細仕様（基本設計フェーズ）に入り、増員枠として参画。', '基本設計～テスト経験
チーム内、顧客とのコミュニケーション力
Java（Spring Boot系）での業務システム経験4年以上', 'AWS環境下での開発経験', '～55万円（スキル見合い） ※精算幅：140h～200h', NULL, 55, 'フルリモート', 0, '9月～', '2026-09-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('生保会社向け、テスト環境整備作業', '生保会社向け、テスト環境整備作業
・IT、STテスト環境整備・運営サポート作業
・案件登録、開発モジュールパッケージング、本番移行作業
・四半期に一度、定例業務
・テスト環境整備・運営サポートに伴う資料作成
※開発作業は、基本、発生をしません。', 'Excel資料作成経験者、Word、PowerPointを使用しての資料作成経験者
※Excel関数を使用して表計算、グラフ作成レベル
開発作業でのテスト作業経験
※SQL、Shellが理解、組める方（基本的なコマンド等）
※オープン系開発経験、開発現場に従事した方が理想
※基本的なIT知識、PC操作ができる方
コミュニケーション力のある方', 'VBA経験があれば、なお、良い。
Eclipse、JP1、TeraTerm等経験あれば、なお、良い', 'スキル見合い（月額固定）', NULL, NULL, '新大阪', 1, '10月〜長期予定', '2026-10-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('地方銀行向け印鑑システム開発（品川）', '地方銀行向け印鑑システムにおけるオープン系（Windows系）の開発・構築対応。印鑑Webサーバの新規構築、およびアプリケーションの新規開発（タブレット用REST APIの開発含む）、印鑑票データ登録バッチ開発', 'C#開発経験3年
基本設計経験', '要件定義経験
保守対応経験
金融経験', '60万~65万', 60, 65, '品川', 1, '8月or8月中旬', '2026-08-01', NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('デジタルマーケティング支援', '某大手通信企業の代理店にて、SQL・PowerBIを活用した分析業務をお任せします。
各種資料作成やツールの移行作業・進行管理についてもご対応いただくことが想定されます。', '・SQLを活用した分析経験
・PowerBIを用いたダッシュボード構築
・ファシリテートおよび報告能力がある
（専門性のある人だけがクライアントサイドにいるわけでないので、かみ砕いた報告ができる人）', '・TableauからPowerBIの移行経験
・webサイトやアプリの利用履歴やキャンペーン等の申込履歴の分析経験がある
・基盤連携、サーバ関連知識もあると◎
・事業規模が大きいプロジェクトへの参画経験', '1人月単価55～65万（スキル見合い）', 55, 65, '田町駅または溜池山王', 1, '10月～', '2026-10-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('20260708-OS-16：健診システム導入支援案件', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('20260708-OS-17：EDIシステム保守・運用（課題対応）案件', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('ゲーム開発におけるモーションデザイン制作案件', 'Unityを用いたゲーム開発における、モーションデザインの制作。モーションの見た目だけでなく、操作感やテンポも含めた設計や、実際にUnityを操作して確認などの業務。', 'モーション・演出に関するポートフォリオのご提出
コンシュマーゲームの開発経験8年以上
Unityを用いたモーションの制作・実装・調整経験3年以上
モーション・演出仕様書の作成経験
プログラマーやデザイナーと仕様ベースで調整・進行したご経験', NULL, '80万円まで ※スキル見合いで上振れ相談可', NULL, 80, '東京駅', 2, '即日 / 8月〜', NULL, 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('二次元コンテンツを扱うサービスのバックエンド開発案件', '大手事業会社での各種開発や運用保守業務。二次元コンテンツを扱うサービスのバックエンド開発。', 'アダルトコンテンツに抵抗のない方
PHP(Laravel)を用いたサーバーサイドの開発経験3年以上
ドメイン駆動設計(DDD)を用いた開発経験1年以上
数十万レコード以上のWebサービスの開発経験
テスト仕様書の作成およびテスト実施まで一貫した経験
JavaScriptを用いた開発経験
コードレビューの経験', 'パフォーマンスチューニングのご経験
イベントストーミングの実施経験', '100万前後まで ※スキル見合い', NULL, 100, '六本木一丁目', 1, '即日 / 8月〜', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('大手損害保険会社向け システム開発・保守支援（ホスト・COBOL領域）', '損害保険業務におけるシステムの開発（外部設計～本番稼働確認）および保守業務
・外部設計、詳細設計等の上流工程の推進
・外部委託会社への開発依頼、および納品された成果物の受入・確認テスト
・本番稼働確認、保守運用に伴う各種対応
・事業会社（エンドユーザー）、システムズ社員、委託会社との各種調整・連携', '・ホスト環境および、COBOLを用いたシステム開発の実務経験
・外部設計からテスト・本番移行までの一連の工程に携わった経験
※開発自体は外部委託となるため、成果物を的確にレビューできる知識があれば、直近のガッツリとしたコーディング経験は不問です。
・複数の関係者（事業会社、自社、委託先）の間に入り、円滑に調整ができる高いコミュニケーション能力
・指示待ちではなく、自発的・能動的にタスクを見つけて動ける方', '・損害保険、または金融分野における業務知識やプロジェクト参画経験', '60万（スキル見合い）', NULL, NULL, '高田馬場', 2, '2026年8月～長期', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('交通系ToCサービスのバックエンド開発案件', '交通系ToCサービス開発プロジェクトにおいて、バックエンドシステムの開発を担当をお願いいたします。
・要件定義〜技術設計
・バックエンド開発
・DB設計
・SQL実装
・パフォーマンスチューニング
・プロダクトリリース対応 etc', 'Pythonを用いたWebアプリの開発経験
10名以上の規模でのPM / PL経験
自社開発企業でのtoBtoC向けサービスの開発経験1年以上
数百テーブル数以上のDBでの設計・構築経験
DBのパフォーマンスチューニングのご経験
要件定義から技術設計に落とし込んだご経験
クラウド環境での開発経験', 'BigQueryの利用経験
Terraformを用いたIaC経験
GCP環境での開発経験', '80〜120万円 ※スキル見合い', 80, 120, NULL, 0, '10月〜', '2026-10-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('自賠責保険会社COBOL化対応支援', 'NATURAL言語で作成されているソースをコンバージョンツールを通してCOBOLソースに変換し、変換できなかった部分を手作業で構築
ADABASからXDM/RDへの変換はすべて手作業で実施します。
開発・単体テスト実施後、組み合わせテスト／結合テスト／システムテストを実施するため、移行計画やテスト計画を立てていただきます。', '・日立COBOL経験', '・システム移行経験
・NATURAL経験', 'max55万（スキル見合い）', NULL, 55, '春日駅', 1, '8月〜', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('SOC運用オペレーション業務', 'セキュリティアラート対応
セキュリティツールを使用した運用オペレーション業務
各種ドキュメント作成・修正', 'WindowsとLinuxの基本的な知識
Excel・Wordなどの基本操作
一般的なPC操作、夜勤に問題が無い
コミュニケーション能力', 'ITパスポート所持者
LPIC Level1 所持者', '35~38万前後(スキル見合い)', 35, 38, '堂島（最寄駅：福島駅、新福島駅）', 2, '2026年8月または8月中旬〜長期', '2026-08-01', 2, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('自賠責保険会社COBOL化対応支援', 'NATURAL言語で作成されているソースをコンバージョンツールを通してCOBOLソースに変換し、変換できなかった部分を手作業で構築
ADABASからXDM/RDへの変換はすべて手作業で実施します。
開発・単体テスト実施後、組み合わせテスト／結合テスト／システムテストを実施するため、移行計画やテスト計画を立てていただきます。', '・日立COBOL経験
・NATURAL経験', '・システム移行経験', 'max55万（スキル見合い）', NULL, 55, '春日駅', 1, '8月〜', '2026-08-01', 1, 0);
INSERT INTO `ses`.`projects` (`title`, `description`, `required_skills_text`, `preferred_skills_text`, `price_text`, `unit_price_min`, `unit_price_max`, `location`, `remote_type`, `start_text`, `start_ym`, `interview_count`, `status`) VALUES ('Javaシステム開発・保守エンハンス支援', '金融機関向けJavaを用いたシステムの保守・エンハンス開発において、見積もりから開発推進、保守まで一貫して対応可能なエンジニアを募集しています。リーダー経験ある方は確度高いです。', '・Javaによる開発経験　※詳細設計以降対応可能な方
・Linux／UNIX環境におけるサーバーのCUI操作経験
・SQLを用いたデータベース開発経験（DB2、Oracle、MySQL等）', '・C言語による開発経験
・Strutsを用いた開発経験
・Shellスクリプト・Shellコマンドを利用した開発経験
・ユーザー企業向け案件における元請けまたは一次請けの経験
・請負契約案件でのプロジェクト推進経験', '60∼65万（140h∼180h） ※スキル見合い', 60, 65, '長野市', 2, '9月～　※長期想定', '2026-09-01', 2, 0);

-- ----------------------------------------------------------------------------
-- project_skills（required_skills_text由来=必須, preferred_skills_text由来=歓迎）
-- 注意: project_id は本ファイルを空のprojectsテーブルに対して実行する前提の連番参照
-- ----------------------------------------------------------------------------
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (1, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AI開発'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (1, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Git'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (1, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (2, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'プロジェクトリーダー'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '運用保守'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (4, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (4, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (4, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (4, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL/SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (4, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (4, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (4, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (5, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (5, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (5, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (5, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (6, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (6, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (6, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PMO'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (7, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (7, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (7, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'iOS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (8, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Android'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (8, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Flutter'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (8, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'iOS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (9, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PowerShell'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (9, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (10, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (10, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (11, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (11, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Docker'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Git'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitHub'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PostgreSQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring Boot'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'TypeScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (12, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'MyBatis'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (13, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (13, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (13, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL/SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (13, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (14, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (14, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (14, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'HTML'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (14, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (14, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (14, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (15, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (15, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (15, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL Server'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (15, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (16, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (16, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (17, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (17, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (17, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (17, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (17, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'TypeScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (17, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '生成AI'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (17, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Angular'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (17, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (17, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Vue.js'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (18, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (19, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (19, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (19, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (19, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (19, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (19, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (20, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (20, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (20, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring Boot'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (20, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (20, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (20, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '生成AI'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (21, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (21, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (22, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (22, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (22, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (22, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (23, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (23, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (23, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GCP'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (23, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (23, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (23, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows Server'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (23, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (23, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (23, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (24, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (24, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (24, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (24, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL Server'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (25, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (25, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (25, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (25, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (25, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (26, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (26, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (27, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (27, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AI開発'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (27, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (28, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (28, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (28, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (28, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (29, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (30, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PowerShell'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (30, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (30, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (30, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (32, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (32, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (33, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (33, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (33, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (33, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (33, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PMO'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (33, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (33, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (33, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL Server'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (34, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (34, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (35, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (36, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (36, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (36, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (37, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (37, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (37, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (37, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (38, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (38, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (39, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Angular'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (39, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (39, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (39, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (39, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (39, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (39, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (40, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VMware'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (40, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (40, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (41, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (41, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (42, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (42, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (44, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (44, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (44, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (44, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (45, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (45, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (45, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'COBOL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (45, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (46, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Cisco'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (47, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (47, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (47, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Angular'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (47, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (47, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (47, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (47, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (47, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (47, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (47, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (48, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'COBOL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (49, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (49, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PMO'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (50, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '生成AI'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (50, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (51, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (51, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VMware'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (51, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (52, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Kotlin'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (52, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Swift'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (52, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Node.js'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (52, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (53, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Ruby'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (53, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Ruby on Rails'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (53, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (53, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (53, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (54, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (54, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'ネットワーク構築'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (54, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (55, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Docker'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (55, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'FastAPI'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (55, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Kubernetes'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (55, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (55, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Terraform'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (56, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (57, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Cisco'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (58, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (58, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (59, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (60, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (60, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (60, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (60, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (60, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (60, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (60, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL/SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (60, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (60, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Struts'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (60, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VBA'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (62, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (62, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (62, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Laravel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (62, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PHP'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (62, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (65, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Docker'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (65, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Laravel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (65, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PHP'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (65, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (65, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (65, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (65, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (65, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (66, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Android'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (66, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Flutter'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (66, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'iOS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (67, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (67, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (67, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (68, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (68, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (68, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (69, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (69, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (69, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (69, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (69, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (69, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL/SQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (69, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (70, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (70, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (70, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (70, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (70, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'プロジェクトリーダー'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (70, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (70, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (70, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '運用保守'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (71, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (71, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (71, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C++'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (72, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (72, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (72, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'iOS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (73, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Android'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (73, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Flutter'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (73, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'iOS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (74, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (74, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (74, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL/SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (74, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (74, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (75, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (75, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (75, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (75, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (75, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'TypeScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (75, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '生成AI'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (75, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Angular'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (75, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (75, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Vue.js'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (77, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (77, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (77, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring Boot'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (77, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (77, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (77, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '生成AI'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (78, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (79, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C++'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (79, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (79, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (79, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Git'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (79, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (79, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (80, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (80, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (80, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'CSS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (80, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'HTML'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (80, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (80, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (80, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (81, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (81, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (82, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (82, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (82, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL/SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (82, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (82, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (82, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (82, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (82, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (82, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (83, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (83, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AI開発'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (83, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (85, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (85, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PostgreSQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (85, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (85, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VMware'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (85, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (86, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Cisco'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (87, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '生成AI'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (88, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Go'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (88, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (88, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Kubernetes'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (88, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (88, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (88, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (88, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Docker'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (88, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GCP'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (88, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'MongoDB'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (88, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PostgreSQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (88, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (89, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Docker'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (89, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Git'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (89, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitHub'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (89, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Go'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (89, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'MySQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (89, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (89, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (89, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (89, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (90, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (90, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (90, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '生成AI'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (90, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'DynamoDB'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (90, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (90, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (90, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (91, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (91, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (91, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (91, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PMO'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (92, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (92, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '運用保守'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (94, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (94, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (95, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (95, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (95, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (95, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (95, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PMO'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (95, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (95, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (95, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL Server'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (96, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (96, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (97, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (97, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (97, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (98, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (98, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (98, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (98, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (99, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (99, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (100, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Angular'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (100, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (100, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (100, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (100, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (100, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (100, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (101, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VMware'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (101, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (101, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (102, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (102, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (103, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (104, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (104, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (105, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (106, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (106, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PMO'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (106, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (107, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (107, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Salesforce'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (107, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (107, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (107, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (107, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '運用保守'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (108, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Git'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (108, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitLab'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (108, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Jenkins'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (108, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Kubernetes'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (108, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (108, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (108, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PostgreSQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (108, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (109, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'COBOL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (110, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (110, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VMware'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (110, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (111, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (111, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (112, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (112, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (113, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (113, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (113, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (113, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Perl'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (113, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PostgreSQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (113, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (114, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (114, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (114, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (115, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (115, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (115, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows Server'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (115, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (115, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (115, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (115, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PMO'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (116, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (117, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (117, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (117, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Power BI'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (118, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PHP'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (118, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (119, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VBA'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (119, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (119, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (120, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (120, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (120, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (121, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (121, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (121, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (121, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (121, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (122, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (123, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (123, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (124, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Cisco'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (125, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (125, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (125, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (125, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (125, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL/SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (125, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (125, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (125, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (125, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (126, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Cisco'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (127, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '運用保守'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (128, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (128, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (128, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (128, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (128, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Git'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (128, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitHub'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (128, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitLab'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (128, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '生成AI'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (131, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (131, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (132, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (132, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (132, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (132, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'サーバー構築'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (132, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (132, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (133, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Next.js'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (133, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'TypeScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (133, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Laravel'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (134, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (134, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Git'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (134, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (134, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (134, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (134, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (134, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (134, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (135, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (135, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (136, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (136, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (136, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (136, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (137, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (138, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'プロジェクトリーダー'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (139, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (139, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (141, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Ruby'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (141, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Ruby on Rails'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (141, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (141, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (141, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (142, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Backlog'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (142, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JIRA'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (143, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (144, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (144, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (144, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Laravel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (144, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PHP'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (144, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (145, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Docker'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (145, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Laravel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (145, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PHP'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (145, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (145, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (145, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (145, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (145, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (146, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Android'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (146, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Flutter'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (146, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'iOS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (147, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (148, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (148, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (148, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (148, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (148, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'BigQuery'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (148, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GCP'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (148, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Terraform'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (149, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (149, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (149, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (149, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (149, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL Server'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (149, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (149, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VBA'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (149, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (149, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (150, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (150, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (150, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (150, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (150, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'プロジェクトリーダー'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (150, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (150, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (150, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '運用保守'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (151, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (151, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (152, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (152, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (152, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (153, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (153, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VBA'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (154, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (154, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (154, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'CSS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (154, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'HTML'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (154, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (154, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (154, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (155, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (155, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (155, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL/SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (155, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (155, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (155, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (155, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (155, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (155, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (155, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (156, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Kubernetes'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (156, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (157, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (157, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (157, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Redmine'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (158, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (158, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VBA'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (160, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (160, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C++'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (160, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (160, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (160, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (161, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (161, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (161, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (162, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (162, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (162, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (162, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (162, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (163, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'COBOL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (164, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (164, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '運用保守'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (165, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (165, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (165, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows Server'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (165, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (165, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (165, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (165, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PMO'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (166, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (166, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (168, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (168, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (169, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (169, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (169, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (169, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (169, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (169, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL Server'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (169, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PowerShell'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (169, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (169, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (170, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Next.js'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (170, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'TypeScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (170, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Laravel'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (171, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Laravel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (171, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'MySQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (171, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PHP'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (171, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (171, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (172, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (172, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C++'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (172, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (173, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (173, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (173, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (173, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (175, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Laravel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (175, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PHP'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (175, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (175, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (179, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'TypeScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (180, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'COBOL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (180, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (180, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (181, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (181, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (181, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Power BI'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (182, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (182, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VMware'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (182, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (183, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (183, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (183, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'TypeScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GCP'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Git'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitHub'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitHub Copilot'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Go'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JIRA'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Node.js'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PostgreSQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Redis'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (185, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '生成AI'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (186, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (186, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Docker'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (186, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Kubernetes'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (186, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (186, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (186, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (186, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PMO'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (186, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PostgreSQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (187, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (187, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Angular'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (188, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (188, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (188, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (188, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (189, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (189, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (190, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (190, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (190, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (190, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (190, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (190, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (190, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (191, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Snowflake'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (191, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (191, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (192, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (192, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (193, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (193, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (193, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Angular'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (193, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (193, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (193, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (193, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PostgreSQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (193, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (193, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (193, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (193, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (194, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (195, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (195, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (196, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (196, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (197, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Cisco'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (197, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'ネットワーク構築'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (198, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (198, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Ansible'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (198, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (199, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (200, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (200, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (200, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (200, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (201, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (202, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (203, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VMware'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (204, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'COBOL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (205, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (206, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (206, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PMO'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (206, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (207, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Flutter'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (207, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (208, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (209, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (209, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (209, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '運用保守'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (209, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AI開発'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (209, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Git'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (209, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitHub'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (209, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitHub Copilot'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (209, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (209, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (210, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Git'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (210, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitHub'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (210, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitLab'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (210, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (210, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (210, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (210, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (211, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Laravel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (211, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PHP'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (211, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (211, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (211, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (211, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (211, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (211, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (212, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (212, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (212, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Spring Boot'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (212, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (212, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (212, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (213, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (213, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (213, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (213, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (213, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (213, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VBA'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (214, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (214, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (214, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (215, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (215, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Tableau'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (218, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Unity'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (219, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (219, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'JavaScript'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (219, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Laravel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (219, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PHP'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (219, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (220, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'COBOL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (220, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (221, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (221, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (221, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Python'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (221, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (221, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'BigQuery'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (221, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GCP'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (221, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Terraform'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (222, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'COBOL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (223, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Excel'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (223, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (223, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (224, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'COBOL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (225, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'DB2'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (225, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Java'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (225, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (225, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'MySQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (225, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Oracle'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (225, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SQL'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (225, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Unix'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (225, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 1);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (225, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C言語'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (225, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 0);
INSERT INTO `ses`.`project_skills` (`project_id`, `skill_id`, `required`) VALUES (225, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Struts'), 0);

-- ----------------------------------------------------------------------------
-- personnel（ダミー社員/管理BP, 10名。マッチング動作確認用）
-- ----------------------------------------------------------------------------
INSERT INTO `ses`.`personnel` (`personnel_type`, `name`, `status`, `available_from`, `nearest_station`, `partner_company`, `desired_unit_price_min`, `desired_unit_price_max`, `memo`) VALUES (0, '山田太郎', 0, NULL, '大宮', NULL, 650000, 900000, '');
INSERT INTO `ses`.`personnel` (`personnel_type`, `name`, `status`, `available_from`, `nearest_station`, `partner_company`, `desired_unit_price_min`, `desired_unit_price_max`, `memo`) VALUES (0, '佐藤健一', 0, NULL, '梅田', NULL, 550000, 800000, '');
INSERT INTO `ses`.`personnel` (`personnel_type`, `name`, `status`, `available_from`, `nearest_station`, `partner_company`, `desired_unit_price_min`, `desired_unit_price_max`, `memo`) VALUES (0, '鈴木一郎', 2, '2026-10-01', '梅田', NULL, 550000, 900000, '');
INSERT INTO `ses`.`personnel` (`personnel_type`, `name`, `status`, `available_from`, `nearest_station`, `partner_company`, `desired_unit_price_min`, `desired_unit_price_max`, `memo`) VALUES (0, '高橋花子', 0, NULL, '梅田', NULL, 600000, 750000, '');
INSERT INTO `ses`.`personnel` (`personnel_type`, `name`, `status`, `available_from`, `nearest_station`, `partner_company`, `desired_unit_price_min`, `desired_unit_price_max`, `memo`) VALUES (0, '田中次郎', 0, NULL, '川崎', NULL, 550000, 750000, '');
INSERT INTO `ses`.`personnel` (`personnel_type`, `name`, `status`, `available_from`, `nearest_station`, `partner_company`, `desired_unit_price_min`, `desired_unit_price_max`, `memo`) VALUES (0, '伊藤美咲', 1, '2026-10-01', '梅田', NULL, 700000, 900000, '');
INSERT INTO `ses`.`personnel` (`personnel_type`, `name`, `status`, `available_from`, `nearest_station`, `partner_company`, `desired_unit_price_min`, `desired_unit_price_max`, `memo`) VALUES (1, '渡辺勇気', 0, NULL, '渋谷', 'ベータソリューションズ株式会社', 650000, 800000, '');
INSERT INTO `ses`.`personnel` (`personnel_type`, `name`, `status`, `available_from`, `nearest_station`, `partner_company`, `desired_unit_price_min`, `desired_unit_price_max`, `memo`) VALUES (1, '中村敦', 0, NULL, '渋谷', 'ベータソリューションズ株式会社', 600000, 850000, '');
INSERT INTO `ses`.`personnel` (`personnel_type`, `name`, `status`, `available_from`, `nearest_station`, `partner_company`, `desired_unit_price_min`, `desired_unit_price_max`, `memo`) VALUES (1, '小林蓮', 1, '2026-09-01', '本町', 'ベータソリューションズ株式会社', 700000, 800000, '');
INSERT INTO `ses`.`personnel` (`personnel_type`, `name`, `status`, `available_from`, `nearest_station`, `partner_company`, `desired_unit_price_min`, `desired_unit_price_max`, `memo`) VALUES (1, '加藤陽菜', 0, NULL, '池袋', 'ベータソリューションズ株式会社', 600000, 850000, '');

-- ----------------------------------------------------------------------------
-- personnel_skills（44件）
-- 注意: personnel_id は本ファイルを空のpersonnelテーブルに対して実行する前提の連番参照
-- ----------------------------------------------------------------------------
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (1, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 5);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (1, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'React'), 8);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (1, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'COBOL'), 6);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (1, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 2);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (2, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Angular'), 9);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (2, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VMware'), 7);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (2, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 9);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (2, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'SE'), 1);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 7);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'C#'), 3);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Angular'), 6);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (3, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '詳細設計'), 8);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (4, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 6);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (4, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 1);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (4, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 3);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (4, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Linux'), 2);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (5, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Git'), 7);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (5, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 7);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (5, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Angular'), 5);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (5, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Azure'), 3);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (6, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PMO'), 4);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (6, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'TypeScript'), 4);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (6, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 2);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (6, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PM'), 1);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (7, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '要件定義'), 3);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (7, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '.NET'), 7);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (7, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Windows'), 3);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (7, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'TypeScript'), 3);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (7, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 8);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (8, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PostgreSQL'), 8);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (8, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Kubernetes'), 3);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (8, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'テスト'), 4);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (8, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 4);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (8, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 5);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (9, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PL'), 1);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (9, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '基本設計'), 5);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (9, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'PostgreSQL'), 4);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (9, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '製造'), 4);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (9, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 8);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (10, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'Shell'), 5);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (10, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'GitHub'), 3);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (10, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = '生成AI'), 8);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (10, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'AWS'), 3);
INSERT INTO `ses`.`personnel_skills` (`personnel_id`, `skill_id`, `years`) VALUES (10, (SELECT skill_id FROM `ses`.`skills` WHERE canonical_name = 'VB.NET'), 6);

