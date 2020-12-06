
# テーブル設計

## users テーブル

| Column   | Type   | Options                           |
| -------- | ------ | --------------------------------- |
| family_name        | string   | null: false               |
| first_name         | string   | null: false               |
| family_name_kana   | string   | null: false               |
| first_name_kana    | string   | null: false               |
| nickname           | string   | null; false               |
| email              | string   | null: false , unique:true |
| encripted_password | string   | null: false               |
| birthday           | datetime | nill: false               

### Association
has_many: items
has_many: buys


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| image         | string     | null: false                    |
| item_name     | string     | null: false                    |
| text          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| postage_id    | integer    | null: false                    |
| ship_area_id  | integer    | null: false                    |
| ship_date_id  | integer    | null: false                    |
| price         | integer    | null: false                    |

### Association
belongs_to: user
has_one: buy

## buys テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: item
has_one: address

 ### address テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buy           | references | null: false, foreign_key:true  |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| billding_name | string     |                                |
| phon_number   | string     | null: false                    |

### Association
belongs_to: buy