class OrderItem < ActiveRecord::Base
  belongs_to :products
  belongs_to :orders
  attr_accessible :order_id, :price, :product_id, :quantity
  belongs_to :order
  belongs_to :product
	

end
