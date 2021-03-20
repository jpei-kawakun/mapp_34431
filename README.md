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

