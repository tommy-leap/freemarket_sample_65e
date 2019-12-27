class ProductsController < ApplicationController

  def new
    @product = Product.new
  end
  def create
    Product.create(product_params)
    redirect_to products_error_path
  end

  def index
    @product = Product.all
    @image = Image.find(2)
  end
  
  def show
  end
  def error
  end

  private
  def product_params
    params.require(:product).permit(:title, :info)
  end
end
