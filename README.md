# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchase

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | string     | null: false                    |
| explanation | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| address     | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_one :address
- has_one :purchase
- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building name | string     | null: false                    |
| phone number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase
- belongs_to :items
- belongs_to :user

## purchases　テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| user                         | references | null: false, foreign_key: true |
| item                         | references | null: false, foreign_key: true |


### Association

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
