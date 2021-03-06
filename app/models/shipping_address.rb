class ShippingAddress < ApplicationRecord
  belongs_to :customer

  validates :customer_id, :name, :address, presence: true
	validates :post_code, length: {is: 7}, numericality: { only_integer: true }

		def  address_display
		 '〒' + post_code + ' ' + address + ' ' + name
	 end
end
