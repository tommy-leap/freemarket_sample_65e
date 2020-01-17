# README


# freemarket_sample_65e DB設計
![ER図](https://i.imgur.com/e9GuKDB.jpg)


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|image|text||
|evaluation|integer||
### Association
- has_one :user_detail
- has_many :products
- has_many :likes
- has_many :messages

# user_detailsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|email|string|null: false, unique|
|password|string|null: false||
|first_name|string|null: false|
|first_kana|string|null: false|
|last_name|string|null: false|
|last_kana|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|post_num|integer|null: false|
|from|string|null: false|
|municipalities|string|null: false|
|build_name|string||
|comment|text||
|crdit_num|integer||
### Association
- belongs_to :user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|price|integer|null: false|
|info|text||
|status|integer|null: false|
|postage|text|null: false|
|shipping|text|null: false|
|from|string|null: false|
|day|string|null: false|
|brand_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :category
- belongs_to :brand
- belongs_to :user
- has_many :images
- has_many :messages
- has_many :likes



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_ancestry

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|text||
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
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
### Association
- has_many :products


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|nice|integer||
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product
- belongs_to :user

