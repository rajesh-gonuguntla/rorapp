
class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :sub_category_id,:availability
  belongs_to :sub_category
  has_many :cart_items
  has_many :carts, :through => :cart_items

end
