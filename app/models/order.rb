class Order < ApplicationRecord
  has_many :order_items
  has_many :pending_orders
  belongs_to :user
end
