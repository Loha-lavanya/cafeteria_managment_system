class MenuItemsController < ApplicationController
  before_action :ensure_cart_created
  before_action :ensure_user_logged_in
  before_action :check_if_admin, only: [:create]

  def index
    @menu_items = MenuItem.all.order(created_at: :asc)
  end

  def show
    @menu_item = MenuItem.find (params[:id])
  end

  def new
    @menu_item = MenuItem.new
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def destroy
    menu_item = MenuItem.find(params[:id])
    if menu_item.destroy
      flash[:success] = "#{menu_item.name} has been deleted."
      redirect_to admin_dashboard_path
    else
      flash[:error] = "An error occured. Try deleting #{@menu_item.name} again."
    end
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    @menu_item.menu_category_id = params[:menu_category_id],
                                  @menu_item.name = params[:name],
                                  @menu_item.price = params[:price],
                                  @menu_item.description = params[:description],
                                  @menu_item.menu_item_image = params[:image],
    if @menu_item.save
      flash[:success] = "Menu Item updated succesfully"
    else
      flash[:error] = "An error occured. Try adding #{@menu_item.name} again."
    end
    redirect_to admin_dashboard_path
  end

  def create
    menu_item = MenuItem.create!(
      menu_category_id: params[:menu_category_id],
      name: params[:name],
      price: params[:price],
      description: params[:description],
      menu_item_image: params[:image],
    )
    flash[:success] = "sucessfully item added!"
    #redirect to admin_dashboard_path
  end
end
