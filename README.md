# README

## usersテーブル

| column    |  type   |  options
|-------------------------------------
| nickname  |  string | null: false    
| email     |  string | null: false
| password  |  string | null: false
| last-name |  string | null: false
| first-name|  string | null: false

### Association
- has many :items
- has many :credit
- has_one :address

## itemsテーブル

| column                    | type     |  options
|--------------------------------------------------------
| item-image                | string   | null: false 
| item-name                 | string   | null: false 
| item-info                 | text     | null: false 
| item-category             | string   | null: false 
| item-sales-status         | string   | null: false 
| item-price                | integer  | null: false 
| item-shipping-fee-status  | integer  | null: false 
| item-prefecture           | string   | null: false 
| item-scheduled-delivery   | integer  | null: false 
| user-id                   | references| null: false, foreign_key: true

### Association

- belongs_to : user
- has_one    : credit
- belongs_to : address

## creditテーブル

| column  | type      | option
|--------------------------------------- 
| user   | string     | null: false
| time   | string     | null: false
| item   | string     | null: false
| user-id| references | null: false, foreign_key: true

### Association

- belongs_to : user
- belongs_to : item
- has_one    : address

### addressテーブル
 
| column       | type   | option
|---------------------------------------
| postal-code  | integer| null: false
| prefecture   | string | null: false
| city         | string | null: false
| addresses    | string | null: false
| building     | string | null: false
| phone-number | integer| null: false

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :credit