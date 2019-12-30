class Step1 < ApplicationRecord
  belongs_to :user
  belongs_to :user_detail

  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :encrypted_password, presence: true, uniqueness: true, format: { with: /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}\z/i}
  validates :last_name, null: false, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :first_name, null: false, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :last_kana, null: false, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :first_kana, null: false, format: { with: /\A[ァ-ヶー－]+\z/}

end
