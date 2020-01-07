class SignupController < ApplicationController
  
  def new
  end

  def index
  end

  def step1
    @user = User.new
    @user.build_user_detail
  end

  def step2
  end

  def step3
  end

  def step4
  end

  def step5
  end

  
  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :encrypted_password,
      :image,
      :evaluation,
      user_detail_attributes: [:id, :user_id, :first_name, :first_kana, :last_name, :last_kana, :year, :month, :day, :post_num, :from, :municipalities, :build_name, :comment, :credit_num]
    )
  end
end
