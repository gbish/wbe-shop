class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # This runs the named methods before any page is loaded,
  # to ensure their variables are populated
  before_filter :categories, :expansions, :cart
  
  # Making the list of all categories available
  def categories
    @categories = Category.all
  end
  
  # Same again for expansions, but sorted by date
  def expansions
    @expansions = Expansion.order("release_date DESC")
  end
  
  # If a user is signed in, create a cart
  def cart
    @cart = current_cart if user_signed_in?
  end
  
  private
  
    # Sets up the cart, if an existing one can't be found, it creates a new one
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
end
