# テーブル設計

## users テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false, unique: true      |
| email               | string     | null: false, unique: true      |
| password            | string     | null: false  unique: true      |
| name                | string     | null: false                    |
| furigana            | string     | null: false                    |
| date of birth       | datetime   | null: false                    |

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item name           | string     | null: false                    |
| category            | string     | null: false                    |
| product condition   | string     | null: false                    |
| shipping fee burden | string     | null: false                    |
| shipping region     | string     | null: false                    |
| days until shipping | datetime   | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |


## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| card number         | integer    | null: false                    |
| expiry date         | datetime   | null: false                    |
| security cord       | integer    | null: false                    |
| post code           | integer    | null: false                    |
| prefecture          | string     | null: false                    |
| municipalities      | string     | null: false                    |
| address             | string     | null: false                    |
| building name       | string     | null: false                    |
| tell number         | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

## comments テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| content             | text       | null: false                    |
| prototype           | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |
