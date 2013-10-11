class Order < ActiveRecord::Base
  attr_accessible :email, :phone_number, :ship_to_address, :ship_to_city, :ship_to_country, :ship_to_first_name, :ship_to_last_name, :ship_to_state, :ship_to_zip, :status
  validates :email, :phone_number, :ship_to_address, :ship_to_city, :ship_to_country, :ship_to_first_name, :ship_to_state, :ship_to_zip, presence:true
  has_many :order_items
  has_many :products, :through => :order_items
  belongs_to :member

  
	def process
		result = true
		self.status = 'processed'
		save!
		result
  end

end
