class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :menu_items, :menu_category, :menu_category_id
  end
end
