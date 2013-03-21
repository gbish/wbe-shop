# This is a non-RESTful controller, created to serve the actions
# for the home page and the about page

class HomeController < ApplicationController
  # This action purely pulls the data from the Product class
  def index
    @products = Product.page(params[:page]).per(9)
  end
  
  # This action does nothing as no variables are needed
  # in the view due to it being static html
  def about
  end
end
