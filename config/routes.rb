Shop::Application.routes.draw do
  # Generate the routing paths for admins and users via devise gem
  devise_for :admins, :users
  
  # Generic form of generating RESTful routes for RESful controllers
  resources :line_items
  
  resources :carts, path: "basket" # Modified the wording used to represent the shopping cart in the URI
  
  resources :orders do
    # This allows the Kaminari gem to paginate on a collection, in this case orders, in any of its views
    get ':id/page/:page', :action => :show, :on => :collection
  end

  resources :expansions do
    get ':id/page/:page', :action => :show, :on => :collection
  end

  resources :categories do
    get ':id/page/:page', :action => :show, :on => :collection
  end

  resources :products, path: "cards" do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  resources :home do
    get ':page', :action => :index, :on => :collection
  end
  
  # Create the search route
  match 'search' => 'search#index', :as => :search
  
  # Create the about root
  match 'about' => 'home#about', :as => :about
  
  # Set the entry point to the application
  root :to => "home#index"
end
