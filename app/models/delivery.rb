class Delivery < ApplicationRecord
	belongs_to :customer

	def customers_information
		self.postcode + " " + self.address + " " + self.name
	end
end
