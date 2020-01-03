class UsersController < ApplicationController
  def index
    @product = Product.all
    @image = Image.find(2)
  end

  def show
  end
  
  def profile
  end

  def new
  end

end
