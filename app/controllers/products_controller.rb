class ProductsController < ApplicationController
  def index
    @product = Product.find_by(title:"ベルト")
    @image = Image.find(1)
  end

  def show
  end
end
