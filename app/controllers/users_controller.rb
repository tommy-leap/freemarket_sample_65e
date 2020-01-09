class UsersController < ApplicationController
  def index
    @product = Product.all
  end

  def show
  end
  
  def profile
  end

  def logout
  end

  def identification
    @address = Prefecture.all
    @user = User.new
  end

  def new
  end

  def cardlist_first
    @cardnew
  end

end
