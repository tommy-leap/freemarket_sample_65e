class CardSignupController < ApplicationController
  before_action :get_payjp_info, only: [:new, :create]
  def new
    render layout: false
  end


  def create
    if params['payjp-token'].blank?
      redirect_to action: "new", id: current_user.id
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to step4_signup_index_path
      else
        redirect_to action: "new", id: current_user.id
      end
    end
  end


  private

  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    end
  end
end
