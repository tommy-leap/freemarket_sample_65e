class SignupController < ApplicationController
  
  def new
  end

  def index
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
