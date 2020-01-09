class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :omniauthable
  has_one :user_detail
  validates :nickname, presence: true
  accepts_nested_attributes_for :user_detail
end
