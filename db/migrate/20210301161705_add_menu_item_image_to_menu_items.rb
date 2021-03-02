class AddMenuItemImageToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :menu_item_image, :string
  end
end
