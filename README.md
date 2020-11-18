# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | integer | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| explanation      | string     | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| days_to_ship     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- has_many :comments
- has_one :purchase
- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |



### Association

- belongs_to :purchase


## purchases　テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| address   | references | null: false, foreign_key: true |


### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## comments　テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
