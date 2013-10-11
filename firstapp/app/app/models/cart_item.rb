class CartItem < ActiveRecord::Base
  attr_accessible :quantity, :price, :cart_id, :product_id
  belongs_to :cart
  belongs_to :product
end
