class ProductsController < ApplicationController

  def new
    @product = Product.new
  end
  def create
    Product.create(product_params)
    redirect_to products_error_path
  end

  def index
  end
  
  def show
    render layout: false
  end
  def error
  end

  def detail
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:title, :info)
  end
end
