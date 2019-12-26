class ProductsController < ApplicationController
  def new
    @product = Product.new
  end
  def create
    Product.create(product_params)
  end
  def show
  end

  private
  def product_params
    params.require(:product).permit(:title, :info)
  end
end
