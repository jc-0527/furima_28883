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

| Column        | Type    | Options                        |
| ------------- | --------| ------------------------------ |
| user_id       | integer | null: false, PK                |
| nick_name     | string  | null: false                    |
| name          | string  | null: false                    |
| name_kana     | string  | null: false                    |
| birth_date    | date    | null: false                    |
| password      | string  | null: false                    |
| email_address | string  | null: false                    |
| personal_id   | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items


## items テーブル

| Column            | Type    | Options                         |
| ----------------- | ------- | ------------------------------  |
| item_id           | integer | null: false, PK                 |
| goods             | string  | null: false                     |
| price             | decimal | null: false                     |
| condition         | string  | null: false                     |
| delivery_fee      | string  | null: false                     |
| origin_area       | string  | null: false                     |
| shipment_date     | string  | null: false                     |
| shipper_comment   | text    | null: false                     |
| category_id       | integer | null: false, foreign_key: true  |
| user_id           | integer | null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_one :shipping_address

## shipping_addresses テーブル

| Column         | Type    | Options                        |
| -------------- | --------| ------------------------------ |
| shipping_id    | integer | null: false, PK                |
| postal_code    | string  | null: false                    |
| address        | string  | null: false                    |
| phone_number   | string  | null: false                    |
| user_id        | integer | null: false, foreign_key: true |
| item_id        | integer | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
