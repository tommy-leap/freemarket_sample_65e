class SignupController < ApplicationController
  
  def new
  end

  def index
  end

  def step1
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
    )
  end
end
