# アプリケーション名  0.0004％
# アプリケーション概要  0.0004%は、登録したユーザー同士が気軽にメッセージを送りあえるサービスです。
# URL
# テスト用アカウント  Email: ,Pass:
# 利用方法  新規会員登録→ログイン→ユーザーを選択する→メッセージを送る(いいねをする)
# 目指した課題解決  このアプリを通して、共通の趣味・思考を持っている人が繋がりやすい環境を作りたいと考えました。作成者は前職で飲食をしており、そこで出会ったお客様同士の繋がりに感動しました。共通の趣味のお客様を紹介すると作成者が思っていた以上に、意気投合していました。このコロナ渦の中で、日本の自殺者数は年間２万人を超え、11年ぶりに増加したというニュースを見ました。その時に意気投合できる仲間、居場所があれば少しは結果が変わっていたかもしれません。メリット・デメリットで付き合う大人の関係だけではなく、何も考えずに意気投合できる仲間を見つけられるようなプラットフォームを作りたいと思いました。
# 要件定義
| 機能 | 目的 | 詳細 | ストーリー |
| ------------- | ---------- | ----------- | -------------- |
| 新規会員登録機能 | 新規会員登録をする為 | 新規会員を登録する | プロフィールを入力して登録する |
| ログイン機能 | ユーザーがログインする為 | ユーザーのログイン| ニックネーム、パスワードを登録してログインする |
| マイページ機能 | ユーザー自身の情報を確認する為 | ログインしたユーザーのユーザー情報 | プロフィールの確認、編集等をする |
| 検索機能 | 他ユーザーの情報を検索する為 | 他のユーザーを検索(キーワード) | キーワードなどを入力して他ユーザー情報を調べる |
| 口コミ機能 | 他ユーザーの評価する為 | ユーザーが他ユーザーを評価 | 口コミを投稿して、他ユーザーの評価をする |
| 退会機能 | 会員登録を解除する為 | 会員登録を退会 | 退会機能を利用して、ユーザー情報を削除する |
| メッセージ送受信機能 | 他ユーザーにコンタクトを取る為 | ユーザー同士のメッセージ送受信 | 他ユーザーにメッセージを送ってコンタクトする |
| 本人確認機能 | 利用者が本人か確認する為 | 登録しているユーザーが本人か確認 | 身分証明証などの情報を登録し、ユーザーが本人か確認する |
| SMS関連機能 | 電話番号等を紐付けする為 | 電話番号等の紐付け | 電話番号のSMSを利用して、登録されている携帯電話が本人か確認する |
| いいね機能 | ユーザー同士が評価する為 | いいねボタンを設置 | ユーザー同士がいいねをして意思表示する |
# 実装した機能
 新規会員登録機能,ログイン機能,マイページ機能, 退会機能,いいね機能
# 実装予定機能
 検索機能,口コミ機能,本人確認機能,SMS関連機能,メッセージ機能
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false, unique:true |
| encrypted_password | string | null: false |
| gender | integer | null: false |
| hobby | string | null: false |
| self_introduction | text | null: false |
| birth_day | date | null: false |
### Association

 - has_many :relationships
 - has_many :followings, through: :relationships, source: :follow
 - has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key:  'follow_id'
 - has_many :followers, through: :reverse_of_relationships, source: :user

## relationships テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| follow | references | null: false, foreign_key: true: { to_table: :users } |

### Association

 - belongs_to :user
 - belongs_to :follow, class_name: 'User'

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- has_one :destination
- belongs_to :user
- belongs_to :item

## destinations テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_code   | string | null: false |
| prefecture_id   | integer | null: false |
| city   | string | null: false |
| address   | string | null: false |
| building_name   | string |  
| phone_number   | string | null: false |
| purchase   | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase

# ローカルでの動作方法

