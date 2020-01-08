class Product < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40, message: '40文字以内で入力してください' }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 9999999, message: '300以上9999999以下で入力してください'}
  validates :status, :postage, :shipping, :day, presence: true, numericality: { only_integer: true, greater_than: 1, message: '選択してください'}
  validates :info, presence: true, length: { maximum: 1000, message: '1000文字以内で入力してください'}
  # validate :add_error_sample
 
  # def add_error_sample
  #   # nameが空のときにエラーメッセージを追加する
  #   if title.blank?
  #     errors[:base] << "入力してください"
  #   end
  #   if info.blank?
  #     errors[:base] << "入力してください"
  #   end
  #   if price.blank?
  #     errors[:base] << "入力してください"
  #   end

  # end
  # , :postage, :shipping, :from, :day, :category_id, :user_id,
  has_one :category
  has_one :brand
  # belongs_to :user
  has_many :images
  has_many :messages
  has_many :likes
  accepts_nested_attributes_for :images, allow_destroy: true

end
