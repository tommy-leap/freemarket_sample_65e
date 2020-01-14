class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :title, presence: true, length: { maximum: 40, message: '40文字以内で入力してください' }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 9999999, message: '300以上9999999以下で入力してください'}
  validates :status, :postage, :shipping, :day, presence: true, 
      exclusion: { in: %w(---), message: "選択してください" }
  validates :info, presence: true, length: { maximum: 1000, message: '1000文字以内で入力してください'}
  validates :prefecture_id, presence: true, numericality: { only_integer: true, greater_than: 0, message: '選択してください'}


  has_one :brand
  has_many :images
  has_many :messages
  has_many :likes
  has_one :category
  belongs_to :user

  accepts_nested_attributes_for :images, allow_destroy: true

end
