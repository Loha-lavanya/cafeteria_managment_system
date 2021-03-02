class Cart < ApplicationRecord

  def initialize(cart_data)
  if cart_data
    @cart_data = cart_data
  else
      @cart_data={}
	end

  #getter method
  def cart_data
    @cart_data
  end

  def destroy
	  @cart_data = nil
	end

  def delete
		@cart_data[items_id] = 0
	end

  def increment(item_id)
    # || =  if cart_data[item_id] == nothing   cart_data[item_id]=0
    # else  cart_data[item_id]=cart_data[item_id]
    @cart_data[item_id] ||= 0
    @cart_data[item_id] += 1
  end


end
