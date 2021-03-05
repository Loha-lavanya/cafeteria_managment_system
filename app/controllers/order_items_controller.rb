class OrderItemsController < ApplicationController
  before_action :order_created

  def create
    @current_cart.cart_items.each do |cart_item|
      chosen_item = MenuItem.find_by(id: cart_item.menu_item_id)
      order_item = OrderItem.new(
        order_id: @order.id,
        menu_item_id: chosen_item.id,
        menu_item_name: chosen_item.name,
        menu_item_price: cart_item.quantity.to_i * chosen_item.price.to_i,
      )
      order_item.save
      cart_item.cart_id = nil
      CartItem.destroy(cart_item.id)
    end
    Cart.destroy(session[:current_cart_id])
    session[:current_cart_id] = nil
    #redirect_to menu_items_path
    render plain: <h1>"Succesfully Ordered!"<h1>
  end
end