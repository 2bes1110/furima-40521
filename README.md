# テーブル設計

## users テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false                    |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| name                | string     | null: false                    |
| furigana            | string     | null: false                    |
| birthday            | datetime   | null: false                    |

### Association
 has_many items
 has_many orders

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| item_name              | string     | null: false                    |
| category_id            | integer    |                                |
| product_condition_id   | integer    |                                |
| shipping_fee_burden_id | integer    |                                |
| shipping_region_id     | integer    |                                |
| days_until_shipping_id | integer    |                                |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 has_one :order

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| shipping_region_id  | references | null: false, foreign_key: true |
| municipalities      | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     | null: false                    |
| phone_number        | integer    | null: false                    |

### Association
 belongs_to :user
 belongs_to :order
 has_one :shared

 ## shared テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
belongs_to :order
