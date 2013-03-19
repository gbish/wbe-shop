class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :categories, :expansions, :image_list, :cart
  
  def categories
    @categories = Category.all
  end
  
  def expansions
    @expansions = Expansion.order("release_date DESC")
  end
  
  def image_list
    @images = Dir.glob('app/assets/images/*.jpeg').map { |image| image.split('/').last }
  end
  
  def cart
    @cart = current_cart if user_signed_in?
  end
  
  private
  
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
end
