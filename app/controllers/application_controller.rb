class ApplicationController < ActionController::Base
  before_action :current_cart

  def check_if_admin
    unless current_user && current_user.role == "admin"
      flash[:danger] = "Your'e not admin."
      redirect_to "/"
    end
  end

  def is_admin?
    current_user && current_user.role == "admin"
  end

  def ensure_user_logged_in
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to "/"
    end
  end

  def ensure_cart_created
    unless current_cart
      redirect_to "/"
    end
  end

  def current_user
    return @current_user if @current_user

    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end

  def current_cart
    return @current_cart if @current_cart

    current_cart_id = session[:current_cart_id]
    if current_cart_id
      @current_cart = Cart.find(current_cart_id)
    else
      @current_cart = Cart.create(:user_id => session[:current_user_id])
      @current_cart.save
      session[:current_cart_id] = @current_cart.id
    end
  end

  def order_created
    @order = Order.new(:date => Time.now, :user_id => session[:current_user_id], :total_price => 0.0)
    @order.save
  end
end
