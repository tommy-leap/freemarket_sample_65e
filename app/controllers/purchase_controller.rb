class PurchaseController < ApplicationController
  layout false, only: [:index]
  require 'payjp'        #Payjpの読み込み
  before_action :set_card, :set_product

  def index
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "add"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @default_card_information.brand      
      case @card_brand
      when "Visa"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?1714804574"
      when "JCB"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?1714804574"
      when "MasterCard"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?1714804574"
      when "American Express"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?1714804574"
      when "Diners Club"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?1714804574"
      when "Discover"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/discover.svg?1714804574"
      end
    end
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
    :amount => @product.price,          #支払金額を引っ張ってくる
    :customer => @card.customer_id,  #顧客ID
    :currency => 'jpy',              #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end

  def done
    @product_parchaser = Product.find(params[:id])
    @product_parchaser.update(parchaser_id: current_user.id)
    render layout: false
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end
  def set_product
    @product = Product.find(params[:id])
  end
end
