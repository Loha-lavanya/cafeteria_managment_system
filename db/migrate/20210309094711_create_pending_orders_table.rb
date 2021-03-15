class CreatePendingOrdersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :pending_orders do |t|
      t.integer :order_id
      t.timestamps
    end
  end
end
