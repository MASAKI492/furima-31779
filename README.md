# README

## usersテーブル

| column                |  type     |  options
|-------------------------------------
| nickname              |  string   | null: false    
| email                 |  string   | null: false
| password              |  string   | null: false
| password-confirmation |  string   | null: false
| last-name             |  string   | null: false
| first-name            |  string   | null: false

### Association
- has many :items
- has many :credit
- has_one :address

## itemsテーブル

| column                    | type     |  options
|--------------------------------------------------------
| image                | string   | null: false 
| name                 | string   | null: false 
| info                 | text     | null: false 
| category             | integer  | null: false 
| sales-status         | integer  | null: false 
| price                | integer  | null: false 
| shipping-fee-status  | integer  | null: false 
| prefecture           | integer  | null: false 
| scheduled-delivery   | integer  | null: false 
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
| postal-code  | string | null: false
| prefecture   | string | null: false
| city         | string | null: false
| addresses    | string | null: false
| building     | string | 
| phone-number | string | null: false
| credit       | references | null: false, foreign_key: true

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :credit