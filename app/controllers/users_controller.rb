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


  def listing
  end

  def progress
  end

  def completed
  end

  private
  def identification_params
    params.require(:identification).permit(:first_name, :last_name, :first_kana, :last_kana, :year, :month, :day, :post_num, :prefecture, :municipalities, :address, :bulid_name)
  end

end
