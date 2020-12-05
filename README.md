
# テーブル設計

## users テーブル

| Column   | Type   | Options                           |
| -------- | ------ | --------------------------------- |
| family_name      | string | null: false               |
| first_name       | string | null: false               |
| family_name_kana | string | null: false               |
| first_name_kana  | string | null: false               |
| nickname         | string | null; false               |
| email            | string | null: false , unique:true |
| password         | string | null: false               |
| birth_year       | string | nill: false               |
| birth_month      | string | null: false               |
| birth_day        | string | null: false               |

### Association
has_many:item
has_many:buy


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| image         | string     | null: false                    |
| item_name     | string     | null: false                    |
| text          | text       | null: false                    |
| category      | string     | null: false                    |
| item_status   | string     | null: false                    |
| postage       | string     | null: false                    |
| ship_area     | string     | null: false                    |
| ship_date     | datetime   | null: false                    |
| price         | intager    | null: false                    |

### Association
belongs_to:user
has_one:buy

## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |
| card_number   | string     | null: false                    |
| beadline      | datatime   | null: false                    |
| security_code | string     | null: false                    | 
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| billding_name | string     |                                |
| phon_number   | string     | null: false                    |

### Association
belongs_to:user
belongs_to:item