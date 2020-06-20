class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items

	def self.user_deliveries
	  self.postcode + self.address + self.first_name
    end
end
