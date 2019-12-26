class SignupController < ApplicationController
  
  def step1
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
