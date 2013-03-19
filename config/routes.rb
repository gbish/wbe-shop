Shop::Application.routes.draw do
  match 'search' => 'search#index', :as => :search

  resources :orders, :line_items
  
  resources :carts, path: "basket"

  devise_for :admins, :users

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
  
  match 'about' => 'home#about', :as => :about
  
  root :to => "home#index"
end
