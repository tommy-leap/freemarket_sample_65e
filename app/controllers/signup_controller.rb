class SignupController < ApplicationController
  
  def new
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
