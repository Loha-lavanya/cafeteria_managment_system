class CartsController < ApplicationController
  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:current_cart_id] = nil
    redirect_to menu_items_path
  end
end
