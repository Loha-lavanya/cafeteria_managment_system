Rails.application.routes.draw do
  #get "home/index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root "welcome#index"
  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/menu" => "menu#index"
  # get "/menu_items" => "sessions#index"
  #post "/cart_items/:id" => "cart_items#create", as: :add_to_cart
  post "/cart_items/:id/add" => "cart_items#add_quantity", as: :cart_item_add
  post "cart_items/:id/reduce" => "cart_items#reduce_quantity", as: :cart_item_reduce

  resources :users do
    resources :orders
  end
  resources :menu_items
  resources :menu_categories
  resources :cart_items
  resources :carts
end
