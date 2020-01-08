class ProductsController < ApplicationController
  layout false
  def new
    @product = Product.new
    @product.images.new
  end
  def create
    # binding.pry
    @product = Product.new(product_params)
    # redirect_to root_path
    if @product.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @products = Product.includes(:images).order('created_at DESC')
    @product = Product.find_by(title:"ベルト")
    @image = Image.all
    render layout: false
  end
  
  def show
  end

  private
  def product_params
    params.require(:product).permit( :title, :info, :status, :postage, :shipping, :day, :price, images_attributes: [:image])
  end
end
