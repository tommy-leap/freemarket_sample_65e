class SignupController < ApplicationController
  def step1
    @user = User.new
    # @user.build_user_details
  end
  
  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email, 
      :encrypted_password,
      :image
      :evaluation
    )
  
end
