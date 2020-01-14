class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_one :user_detail
  has_many :products
  has_many :cards
  belongs_to :user, optional: true
  has_many :sns_credentials
  # has_one :step1
  # has_one :step2
  # has_many :step4
  

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present? 
      user = User.where(id: snscredential.user_id).first
      unless user.present? 
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential

    else 
      user = User.where(email: auth.info.email).first
      if user.present? 
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else 
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
      end
    end
    return { user: user , sns_id: sns.id }
  end
  validates :nickname, presence: true
  accepts_nested_attributes_for :user_detail
end
