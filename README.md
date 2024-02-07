# README

* Ruby version
ruby 3.1.2

* System dependencies

* Configuration

* Database creation
postgresql

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# sample_manual
■ サービス概要

・マニュアル管理
・理解度チェック
・社内報
・質問箱

など、企業と社員のコミュニケーションアプリ

■　　メインのターゲットユーザー

中小企業

■　　ユーザーが抱える課題

会社の立ち上げ後、まだ内部環境の構築ができていない組織。
「使いやすいマニュアルができていない。社内評価制度が明確でない。部署外とのコミュニケーションに問題がある。お互いに理解できておらず、すれ違いがある。社員が定着しない。引き継ぎが十分にできていない」

など、直接の業務ではないが、必要な部分の整備をしたい中小企業

■　　解決方法

・マニュアル作成機能
→ タイトル、テイスト、画像、動画で作成できる

・e-lerning機能
→　自己チェックできる
→　正答率、理解度を表示して社内評価にも繋げる

・社内報
→　コミュニケーションツール
→　記事型コンテンツで社内報を作れる

・質問箱
→ 疑問点を質問箱で気軽に投げることができる
→ 会社の上層部が、現場の疑問を知ることができる


■　　実装予定の機能
・user
　　・ログインできる
      ・メールアドレス
      ・名前
      ・アイコン
　　・マニュアル閲覧できる
      ・マニュアル一覧
      ・ブックマークできる
　　・社内報が見れる
      ・社内報一覧
      ・コメント機能
    ・質問boxに投稿できる
    　・質問一覧
    　・質問作成
・管理者
　　・ログインできる
      ・メールアドレス
      ・名前
      ・アイコン
　　・マニュアル作成できる
      ・マニュアルの作成
      ・マニュアルの編集・削除ができる
      ・カテゴリー機能
      ・タグ機能
    ・e-lerningが作れる
    　・タイトル
    　・カテゴリー
    　・問題
　　・社内報が作れる
      ・社内報
      ・タグ付けできる
・トップページ
　　・サイドバー
　　・ダッシュボード
　　・検索


・通知機能
　　・新規でマニュアル、e-lerning、社内報が追加されると通知される（オン・オフあり）

■　　なぜこのサービスを作りたいのか？

会社の業務内容や引き継ぎ、評価の透明性がなく現場が混乱している現状があり、改善したいと思ったから。

■　　スケジュール

企画〜技術調査：1/11〆切
README〜ER図作成：1/13 〆切
メイン機能実装：1/14 - 2/29
β版リリース（MVP）：3月
本番リリース：未定

■技術選定
 Rails7
 postgresql
 JavaScript
 Bootstrap
 Devise
 ImageMagick
 MiniMagick
 ActionCable
■ 開発環境: Docker
■ サーバサイド: Ruby on Rails 7系
　　ruby 3.1.2 Rails 7.0.6
■ CSSフレームワーク: bootstrap5系、Silicon（Bootstrapテンプレート）
■ インフラ:
・ Webアプリケーションサーバ: Fly.io
・ ファイルサーバ: AWS S3
・ セッションサーバ: Redis（Redis by Upstash）
・ データベースサーバ: PostgreSQL（Fly Postgres）
■ その他：
・ VCS: GitHub
・ CI/CD: GitHubActions

■ER図

https://gyazo.com/5cb261a2294f3385761b367aa09f2383

■画面遷移図

=======

docker-compose up             

