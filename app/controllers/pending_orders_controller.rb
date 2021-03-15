class PendingOrdersController < ApplicationController
  before_action :check_if_admin

  def delivered
    @pending_order = PendingOrder.find_by(order_id: params[:id])
    order = Order.find(params[:id])
    order.delivered_at = Time.now
    order.save
    flash[:success] = "Ordered delivered succesfully"
  end
end
=begin
  id = pending_order.id
    PendingOrder.destroy(id)
    flash[:success] = "Ordered delivered succesfully"
=end
