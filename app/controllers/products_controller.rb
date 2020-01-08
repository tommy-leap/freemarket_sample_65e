class ProductsController < ApplicationController
    before_action :set_categories, only: %w[edit new]
  def new
    @product = Product.new
    # @category = Category.all
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
  def dynamic_select_category
    @category = Category.find(params[:category_id])
  end


  private
  def product_params
    params.require(:product).permit(:title, :info ,images_attributes:  [:src, :_destroy, :id])
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
