# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
  prepend_before_action :customize_sign_up_params, only: [:create]

  password = Devise.friendly_token.first(7)
  if session[:provider].present? && session[:uid].present?
    @user = User.create(nickname:session[:nickname], email: session[:email], password: "password", first_kana: session[:first_kana],last_kana: session[:last_kana], first_name: session[:first_name], last_name: session[:last_name], year: session[:year], month: session[:month], day: session[:day], phone_num: params[:user][:phone_num])
    sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])
  else
    @user = User.create(nickname:session[:nickname], email: session[:email], password: session[:password], password_confirmation: session[:password_confirmation], first_kana: session[:first_kana],last_kana: session[:last_kana], first_name: session[:first_name], last_name: session[:last_name], year: session[:year], month: session[:month], day: session[:day], phone_num: params[:user][:phone_num])
  end

  def create
    if verify_recaptcha
      super
    else
      self.resource = resource_class.new
      respond_with_navigational(resource) { render :new }
    end
  end
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # # GET /resource/sign_up
  # def new
  #   @user =User.new
  #   super
  # end

  # # POST /resource
  # def step1
  #   super
  # end

  # def step2
  #   super
  # end

  # def step3
  #   super
  # end

  # def step4
  #   Payjp.api_key = "sk_test_4223b676224ef9a3df7b49c9"
  #   Payjp::Charge.create(
  #     amount: 809, # 決済する値段
  #     card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
  #     currency: 'jpy'
  #   )
  # end

  # # GET /resource/edit
  # # def edit
  # #   super
  # # end

  # # PUT /resource
  # # def update
  # #   super
  # # end

  # # DELETE /resource
  # # def destroy
  # #   super
  # # end

  # # GET /resource/cancel
  # # Forces the session data which is usually expired after sign
  # # in to be expired now. This is useful if the user wants to
  # # cancel oauth signing in/up in the middle of the process,
  # # removing all OAuth session data.
  # # def cancel
  # #   super
  # # end

  private
  def customize_sign_up_params
    devise_parameter_sanitizer.permit :sign_up, keys: [:nickname, :email, :password, :password_confirmation, :remember_me]
  end

  def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate
    unless verify_recaptcha(model: resource)
      respond_with_navigational(resource) { render :new }
    end
  end

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
