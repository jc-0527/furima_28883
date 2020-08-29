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

| Column            | Type    | Options                        |
| ----------------- | --------| ------------------------------ |
| nickname          | string  | null: false                    |
| family_name       | string  | null: false                    |
| first_name        | string  | null: false                    |
| family_name_kana  | string  | null: false                    |
| first_name_kana   | string  | null: false                    |
| birth_date        | date    | null: false                    |
| password          | string  | null: false                    |
| email_address     | string  | null: false                    |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type        | Options                         |
| ----------------- | ----------- | ------------------------------  |
| goods             | string      | null: false                     |
| price             | integer     | null: false                     |
| condition         | integer     | null: false                     |
| delivery_fee      | integer     | null: false                     |
| origin_area       | integer     | null: false                     |
| shipment_date     | integer     | null: false                     |
| shipper_comment   | text        | null: false                     |
| category_id       | integer     | null: false                     |
| user              | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase


## shipping_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures    | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- has_one :shipping_address
- belongs_to :user
- belongs_to :item