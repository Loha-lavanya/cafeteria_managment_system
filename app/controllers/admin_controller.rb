class AdminController < ApplicationController
  before_action :check_if_admin, only: [:show]

  def show
    @orders = Order.all
  end

  def menu_items
    @menu_items = MenuItem.all.order(created_at: :asc)
  end

  def orders
    @orders = Order.all
  end

  def users
    @users = User.all
  end

  def category
    @menu_categories = MenuCategory.all
    #render plain: "categoty"
  end
end
