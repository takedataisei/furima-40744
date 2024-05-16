# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## Usersテーブル
|Column             |Type   |Options                  |
|-------------------|-------|-------------------------|
|nickname           |string |null: false              |
|email              |string |null: false, unique: true|
|encrypted_password |string |null: false              |
|family_name        |string |null: false              |
|first_name         |string |null: false              |
|family_name_kana   |string |null: false              |
|first_name_kana    |string |null: false              |
|birth_date         |date   |null: false              |

### Association
- has_many :items
- has_many :orders

## Itemsテーブル
|Column               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|user                 |references |null: false, foreign_key: true |
|name                 |string     |null: false                    |
|item_detail          |text       |null: false                    |
|price                |integer    |null: false                    |
|genre                |integer    |null: false                    |
|item_condition       |integer    |null: false                    |
|shipping_cost_burden |integer    |null: false                    |
|shipping_origin_area |integer    |null: false                    |
|shipping_days        |integer    |null: false                    |
|is_sold_out          |boolean    |null: false, default: false    |

### Association
- has_one :order
- belongs_to :user

## Ordersテーブル
|Column               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|user                 |references |null: false, foreign_key: true |
|item                 |references |null: false, foreign_key: true |
|credit_card_number   |string     |null: false                    |
|expiration_month     |integer    |null: false                    |
|expiration_year      |integer    |null: false                    |
|card_holder_name     |string     |null: false                    |
|security_code        |string     |null: false                    |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル
|Column               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|order                |references |null: false, foreign_key: true |
|post_code            |string     |null: false                    |
|tel_number           |string     |null: false                    |
|prefecture           |string     |null: false                    |
|city                 |string     |null: false                    |
|address_line         |string     |null: false                    |
|building_name        |string     |                               |


### Association
- belongs_to :order