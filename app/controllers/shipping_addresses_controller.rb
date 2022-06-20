class ShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = ShippingAddress.all
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
  	@shipping_address.save
  	redirect_to customer_shipping_addresses_path
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

	def shipping_address_params
  	params.require(:shipping_address).permit(:post_code, :address, :name)
	end
end
