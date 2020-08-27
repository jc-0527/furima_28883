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

## users テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| user_id       | integer       | null: false, PK                |
| nick_name     | varchar(254)  | null: false                    |
| email_address | varchar(254)  | null: false                    |
| personal_id   | integer       | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items

## persons テーブル

| Column        | Type          | Options                         |
| ------------- | ------------- | ------------------------------- |
| personal_id   | integer       | null: false, PK                 |
| name          | varchar(254)  | null: false                     |
| name_kana     | varchar(254)  | null: false                     |
| birth_date    | date          | null: false                     |
| password      | varchar(254)  | null: false                     |
| user_id       | integer       | null: false, foreign_key: true  |

### Association

- has_many :users

## items テーブル

| Column            | Type          | Options                         |
| ----------------- | ------------- | ------------------------------  |
| item_id           | integer       | null: false, PK                 |
| goods             | varchar(254)  | null: false                     |
| price             | decimal       | null: false                     |
| condition         | varchar(254)  | null: false                     |
| delivery_fee      | varchar(254)  | null: false                     |
| origin_area       | varchar(254)  | null: false                     |
| shipment_date     | varchar(254)  | null: false                     |
| shipper_comment   | varchar(5000) | null: false                     |
| category_id       | integer       | null: false, foreign_key: true  |
| user_id           | integer       | null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_one :shipping_address

## shipping_addresses テーブル

| Column         | Type         | Options                        |
| -------------- | ------------ | ------------------------------ |
| id             | integer      | null: false, PK                |
| postal_code    | varchar(10)  | null: false                    |
| address        | string       | null: false                    |
| phone_number   | varchar(15)  | null: false                    |
| item_id        | integer      | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
