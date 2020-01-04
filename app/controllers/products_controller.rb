class ProductsController < ApplicationController

  def new
    @product = Product.new
  end
  def create
    Product.create(product_params)
    redirect_to products_error_path
  end

  def index
    @product = Product.find_by(title:"ベルト")
    @image = Image.find(1)
  end
  
  def show
    render layout: false
  end
  def error
  end

  def detail
  end

  private
  def product_params
    params.require(:product).permit(:title, :info)
  end
end
