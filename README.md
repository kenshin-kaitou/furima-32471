# テーブル設計

## users テーブル

| Column   | Type   | Options                       |
| -------- | ------ | ----------------------------- |
| nickname | string | null: false                   |
| email    | string | null: false, unique: true     |
| password | string | null: false                   |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| information           | text       | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |
| state_id              | integer    | null: false                    |
| category_id           | integer    | null: false 				      |
| shipping_burden_id    | integer    | null: false                    |
| shipper_prefecture_id | integer    | null: false                    |
| shipping_days_id      | integer    | null: false                    |

### Association

- belongs_to :user 
- has_one :purchase

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| shipping | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| postal_code   | integer  | null: false |
| prefecture_id | string   | null: false |
| cities        | string   | null: false |
| address       | integer  | null: false |
| building_name | string   |             |
| phone_number  | integer  | null: false |

### Association

- belongs_to :purchase