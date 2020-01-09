class ProductsController < ApplicationController

  layout false  
  before_action :set_categories, only: %w[edit new]
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
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
    render layout: false
  end

  def detail
    @product = Product.find(params[:id])
  end
  def dynamic_select_category
    @category = Category.find(params[:category_id])
  end


  private
  def product_params

    params.require(:product).permit( :title, :info, :status, :postage, :shipping, :day, :price, images_attributes: [:image])

  end

  def set_product
    @product = Product.find(params[:id])
  end
end

private
def set_categories
  @parent_categories = Category.roots
  @default_child_categories = @parent_categories.first.children
end
