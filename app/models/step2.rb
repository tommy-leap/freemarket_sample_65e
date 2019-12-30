class Step2 < ApplicationRecord
  belongs_to :user
  belongs_to :user_detail

  validates :null: false, format: { with:/\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/}
end