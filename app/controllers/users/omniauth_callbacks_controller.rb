

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
    
  end

  def google_oauth2

    callback_for(:google)
  end

  # def passthru
  # end



  def callback_for(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      @sns = info[:sns]
      render template: "signup/step1" 
    end
  end

  def failure
    redirect_to root_path, alert: 'Facebook認証に失敗しました。'
  end
end
