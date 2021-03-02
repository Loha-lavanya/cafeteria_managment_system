class MenuItemsController < ApplicationController

  # GET /menu_items
  def index
    @menu_items = MenuItem.all.order(created_at: :asc)
    # render template: "menu_items/index"
  end

  # GET /menu_items/id
  def show
    @menu_item = MenuItem.find params[:id]
=begin
    if @menu_item.food_view == nil
      @menu_item.food_view = 1
    else
      @menu_item.food_view += 1
    end
    @menu_item.save
=end
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
      #redirect_to "/"
    else
      flash[:error] = "An error occured. Try deleting #{@menu_item.name} again."
    end
  end
=begin
  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item
       save_menu_item
    else
      flash[:error] = "An error occured. Try adding #{@menu_item.name} again."
    end
  end
=end
end
