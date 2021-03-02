class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.integer :menu_category_id
      t.string :name
      t.string :description
      t.float :price
      t.string :menu_item_image
      t.timestamps
    end
  end
end
