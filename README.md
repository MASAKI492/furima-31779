# README

## usersテーブル

| column                |  type     |  options
|-------------------------------------
| nickname              |  string   | null: false    
| email                 |  string   | null: false
| password              |  string   | null: false
| password_confirmation |  string   | null: false
| last_name             |  string   | null: false
| first_name            |  string   | null: false
| last_name_kana        |  string   | null: false
| first_name_kana       |  string   | null: false
| birth_date            |  date     | null: false

### Association
- has many :items
- has many :credit


## itemsテーブル

| column                    | type     |  options
|--------------------------------------------------------
| image                   | string   | null: false 
| name                    | string   | null: false 
| info                    | text     | null: false 
| category_id             | integer  | null: false 
| sales_status_id         | integer  | null: false 
| price_id                | integer  | null: false 
| shipping_fee_status_id  | integer  | null: false 
| prefecture_id           | integer  | null: false 
| scheduled_delivery_id   | integer  | null: false 
| user                    | references| null: false, foreign_key: true

### Association

- belongs_to : user
- has_one    : credits


## creditテーブル

| column  | type      | option
|--------------------------------------- 
| item   | references | null: false, foreign_key: true
| user   | references | null: false, foreign_key: true

### Association

- belongs_to : user
- belongs_to : item
- has_one    : address

### addressテーブル
 
| column       | type   | option
|---------------------------------------
| postal_code  | string | null: false
| prefecture_id| integer| null: false
| city         | string | null: false
| addresses    | string | null: false
| building     | string | 
| phone_number | string | null: false
| credit       | references | null: false, foreign_key: true

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :credit