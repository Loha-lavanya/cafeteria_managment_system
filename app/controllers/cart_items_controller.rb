class CartItemsController < ApplicationController
  before_action :ensure_cart_created

  def create
    chosen_item = MenuItem.find_by(id: params[:menu_item_id])
    current_cart = @current_cart
    if current_cart.menu_items.include?(chosen_item)
      @cart_item = current_cart.cart_items.find_by(:menu_item_id => chosen_item)
      @cart_item.quantity += 1
    else
      @cart_item = CartItem.new
      @cart_item.cart = current_cart
      @cart_item.quantity = 1
      @cart_item.menu_item = chosen_item
    end
    @cart_item.save
    redirect_to menu_items_path
  end

  def total_price
    self.quantity * self.product.price
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save
    redirect_to cart_path(@current_cart)
  end
end
