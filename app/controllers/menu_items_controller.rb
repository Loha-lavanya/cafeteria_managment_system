class MenuItemsController < ApplicationController

  # GET /menu_items
  def index
    @menu_items = MenuItem.all.order(created_at: :asc)
  end

  # GET /menu_items/id
  def show
    @menu_item = MenuItem.find params[:id]
  end

  #GET /menu_items/new
  def new
    @menu_item = MenuItem.new
  end

  # GET /menu_items/id/edit
  def edit
    @menu_item = MenuItem.find(params[:id])
    render template: "menu_items/new"
  end

  def destroy
    menu_item = MenuItem.find(params[:id])
    if menu_item
      menu_item.destroy
      flash[:success] = "#{menu_item.name} has been deleted."
      redirect_to menu_items_path
    else
      flash[:error] = "An error occured. Try deleting #{@menu_item.name} again."
    end
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item
      save_menu_item
    else
      flash[:error] = "An error occured. Try adding #{@menu_item.name} again."
    end
    redirect_to menu_items_path
  end

  def create
    @menu_item = MenuItem.create(menu_item_params)
    redirect_to menu_items_path
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:menu_category_id, :name, :description, :price, :menu_item_image)
  end
end
