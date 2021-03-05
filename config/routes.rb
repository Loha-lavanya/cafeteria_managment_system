Rails.application.routes.draw do
  #get "home/index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root "welcome#index"
  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/menu" => "menu_items#index"
  # get "/menu_items" => "sessions#index"
  #post "/cart_items/:id" => "cart_items#create", as: :add_to_cart
  post "/cart_items/:id/add" => "cart_items#add_quantity", as: :cart_item_add
  post "cart_items/:id/reduce" => "cart_items#reduce_quantity", as: :cart_item_reduce

  get "admin" => "admin#show", as: :admin_dashboard
  get "admin/menu_items" => "admin#menu_items", as: :admin_menu_items
  get "admin/orders" => "admin#orders", as: :admin_orders
  get "admin/users" => "admin#users", as: :admin_users
  get "admin/categories" => "admin#category", as: :admin_categories
  get "/user/edit/:id" => "user#edit", as: :edit_users

  patch "/update_user/:id" => "user#update", as: :update_users
  resources :users do
    resources :orders
  end
  resources :menu_items
  resources :menu_categories
  resources :cart_items
  resources :carts
  resources :order_items
end
