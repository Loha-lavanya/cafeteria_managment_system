class OrderItemsController < ApplicationController
  before_action :order_created

  def create
    @total = @current_cart.sub_total
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

    #save total amount
    @order.total_price = @total
    @order.save

    Cart.destroy(session[:current_cart_id])
    session[:current_cart_id] = nil
    #render plain: "Succesfully Placed Your Order"
    render template: "order_items/show"
  end
end
