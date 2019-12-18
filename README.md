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

# freemarket_sample_65e DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|image|text||
|evaluation|integer||
### Association
- belongs_to :user-detatile
- has_many :buy_datas
- has_many :likes
- has_many :messages

# user-detatilsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
### Association
- belongs_to :user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|price|integer|null: false|
|info|text||
|status|integer|null: false|
|postage|text|null: false|
|shipping|text|null: false|
|from|string|null: false|
|days|string|null: false|
### Association
- belongs_to :category
- belongs_to :brand
- has_many :images
- has_many :messages
- has_many :likes
- has_many :buy_detas

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many : ancestry

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|massage|text||
|user_id|integer|null: false, foreign_key: true|
|products_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|text||
|product_id|integer|null: false, foreign_key: true|
### Association
- has_many :products

## buy_datasテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|nice|integer||
### Association
- belongs_to :product