# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_kana     | string  | null: false              |
| first_name_kana    | string  | null: false              |
| birthday           | date    | null: false              |
| email              | string  | null: false, default: "" |
| encrypted_password | string  | null: false, default: "" |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| days_to_ship_id     | integer    | null: false                    |
| item_price          | integer    | null: false                    |
| user                | references | foreign_key: true              |


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
| phone_number  | string     | null: false                    |
| purchase      | references | foreign_key: true              |



### Association

- belongs_to :purchase


## purchases　テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | foreign_key: true              |
| item      | references | foreign_key: true              |


### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## comments　テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| item    | references | foreign_key: true              |
| user    | references | foreign_key: true              |

### Association

- belongs_to :item
- belongs_to :user
