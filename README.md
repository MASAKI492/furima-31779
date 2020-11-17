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
| birth_date            |  string   | null: false

### Association
- has many :items
- has many :credit


## itemsテーブル

| column                    | type     |  options
|--------------------------------------------------------
| image                | string   | null: false 
| name                 | string   | null: false 
| info                 | text     | null: false 
| category             | integer  | null: false 
| sales_status         | integer  | null: false 
| price                | integer  | null: false 
| shipping_fee_status  | integer  | null: false 
| prefecture           | integer  | null: false 
| scheduled_delivery   | integer  | null: false 
| user                 | references| null: false, foreign_key: true

### Association

- belongs_to : user
- has_one    : credit
- belongs_to : address

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
| prefecture   | string | null: false
| city         | string | null: false
| addresses    | string | null: false
| building     | string | 
| phone_number | string | null: false
| credit       | references | null: false, foreign_key: true

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :credit