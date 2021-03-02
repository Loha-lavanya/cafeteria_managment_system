class MenuCategoriesController < ApplicationController
  def index
    @categories = MenuCategory.all
    render "/app/views/layouts/_menu_category.html.erb"
  end

  def new
    @category = MenuCategory.new
  end

  def edit
    @category = MenuCategory.find(params[:id])
    render template: "categories/new"
  end

  def show
    @category = MenuCategory.find(params[:id])
    render template: "menu_items/index"
  end
end
