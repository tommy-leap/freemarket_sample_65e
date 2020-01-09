class UserDetail < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true
  validates :first_kana, presence: true
  validates :last_name, presence: true
  validates :last_kana, presence: true
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true

  # ここからstep2
  validates :post_num, presence: true, on: :save_step1_to_session
  validates :prefecture, presence: true, on: :save_step1_to_session
  validates :municipalities, presence: true, on: :save_step1_to_session
  validates :address, presence: true, on: :save_step1_to_session
end
