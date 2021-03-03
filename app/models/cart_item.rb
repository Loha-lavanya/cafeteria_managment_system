class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :menu_item

  def total_price
    self.quantity.to_i * self.menu_item.price.to_i
  end
end
