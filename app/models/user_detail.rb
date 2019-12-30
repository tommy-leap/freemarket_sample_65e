class UserDetail < ApplicationRecord
  belongs_to :user
  has_one :step1
  has_one :step2
  has_many :step4
end
