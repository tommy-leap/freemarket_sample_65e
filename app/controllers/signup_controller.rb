class SignupController < ApplicationController
  require 'payjp'
  def new
    # render layout: false
  end
  before_action :save_step1_to_session, only: :step2
  before_action :save_step2_to_session, only: :step3
  def step1
    @user = User.new
    @user.build_user_detail
    # render layout: false
  end
  def save_step1_to_session
    session[:user_params] = user_params
    session[:user_detail_attributes_after_step1] = user_params[:user_detail_attributes]
    @user = User.new(session[:user_params])
    @user.build_user_detail(session[:user_detail_attributes_after_step1])
    render '/signup/step1e' unless @user.valid?
  end
  
  def step2
    @user = User.new
    @user.build_user_detail
    # render layout: false
  end
  def save_step2_to_session
    session[:user_detail_attributes_after_step2] = user_params[:user_detail_attributes]
    session[:user_detail_attributes_after_step2].merge!(session[:user_detail_attributes_after_step1])
    @user = User.new
    @user.build_user_detail(session[:user_detail_attributes_after_step2])
    # render '/signup/step2' unless @user.build_user_detail.valid?
  end
  
  def step3
    @user = User.new
    @user.build_user_detail
    # render layout: false
  end
  def step4
    # render layout: false
  end
  def create
    @user = User.new(session[:user_params])
    @user.build_user_detail(user_params[:user_detail_attributes])
    @user.build_user_detail(session[:user_detail_attributes_after_step2])
    # binding.pry
    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      # redirect_to step4_signup_index_path
    else
      render '/signup/step1'
    end

    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp_token'].blank?
      render '/signup/step3'
    else
      customer = Payjp::Customer.create(
      
        description: 'test',
        email: current_user.email,
        card: params['payjp_token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card
      )
      # binding.pry
      if @card.save
        redirect_to step4_signup_index_path
      else
        redirect_to action: "create"
      end
    end
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