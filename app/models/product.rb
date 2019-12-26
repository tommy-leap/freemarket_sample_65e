class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  has_many :images
  has_many :messages
  has_many :likes
end