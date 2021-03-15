Rails.application.routes.draw do
  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  post "/cart_items/:id/add" => "cart_items#add_quantity", as: :cart_item_add
  post "cart_items/:id/reduce" => "cart_items#reduce_quantity", as: :cart_item_reduce
  patch "/update_user/:id" => "users#update", as: :update_user
  get "admin" => "admin#show", as: :admin_dashboard
  get "admin/menu_items" => "admin#menu_items", as: :admin_menu_items
  get "admin/orders" => "admin#orders", as: :admin_orders
  get "admin/users" => "admin#users", as: :admin_users
  get "admin/categories" => "admin#category", as: :admin_categories
  delete "pending_orders" => "pending_orders#delivered", as: :pending_orders
  resources :users
  resources :orders
  resources :menu_items
  resources :menu_categories
  resources :cart_items
  resources :carts
  resources :order_items
end
