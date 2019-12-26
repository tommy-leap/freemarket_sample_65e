class ProductsController < ApplicationController
  def index
    @product = Product.all
    @image = Image.find(2)
  end

  def show
  end
end
