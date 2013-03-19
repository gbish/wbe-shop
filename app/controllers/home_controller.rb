class HomeController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(9)
  end
  
  def about
    
  end
end
