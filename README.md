# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

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

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| add          | string     | null: false                    |
| card_number  | string     | null: false                    |
| purchase     | references | null: false, foreign_key: true |
| items        | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase
- belongs_to :items
- belongs_to :user

## purchases　テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| user                         | references | null: false, foreign_key: true |
| item                         | references | null: false, foreign_key: true |
| addresses                    | references | null: false, foreign_key: true |
| purchase_record              | references | null: false, foreign_key: true |

### Association

- has_one :addresses
- has_one :purchase_record
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

## purchase_record テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null; false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| purchase | references | null: false, foreign_key: true |
| address  | references | null; false, foreign_key: true |
| time     | string     | null: false                    |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase
- belongs_to :address
