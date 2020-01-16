class SignupController < ApplicationController
  # render layout: false
  def new
    render layout: false
  end

  before_action :save_step1_to_session, only: :step2
  before_action :save_step2_to_session, only: :create

  def step1
    @user = User.new
    @user.build_user_detail
    render layout: false
  end

  def save_step1_to_session
    session[:user_params] = user_params
    session[:user_detail_attributes_after_step1] = user_params[:user_detail_attributes]
    @user = User.new(session[:user_params])
    @user.build_user_detail(session[:user_detail_attributes_after_step1])
    render step1_signup_index_path, layout: false unless @user.valid?
  end
  
  def step2
    @user = User.new
    @user.build_user_detail
    render layout: false
  end
  def save_step2_to_session
    session[:user_detail_attributes_after_step2] = user_params[:user_detail_attributes]
    session[:user_detail_attributes_after_step2].merge!(session[:user_detail_attributes_after_step1])
    @user = User.new
    @user.build_user_detail(session[:user_detail_attributes_after_step2])
    # binding.pry
    # render '/step/step3' unless @user.build_user_detail.valid?
  end


  def create
    @user = User.new(session[:user_params])
    @user.build_user_detail(user_params[:user_detail_attributes])
    @user.build_user_detail(session[:user_detail_attributes_after_step2])
    if @user.save
      # sessionの値を使ってSnsCredentialのレコードを取得する
      sns = SnsCredential.find(session[:sns_id])
      # @userのidをsnsのuser_idにいれる
      sns.user_id = @user.id
      # snsをDBに保存(更新)する
      sns.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to new_card_signup_path(current_user.id)
    else
      render '/signup/step1'
    end
  end

  def step4
    render layout: false
  end

  
  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :image,
      :evaluation,
      user_detail_attributes: [:id, :user_id, :first_name, :first_kana, :last_name, :last_kana, :year, :month, :day, :post_num, :prefecture_id, :municipalities, :address, :bulid_name, :phone_num, :comment, :credit_num, :payjp_id]
    )
  end
end