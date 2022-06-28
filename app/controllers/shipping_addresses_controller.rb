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
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      flash[:success] = "ジャンルを変更しました"
      redirect_to customer_shipping_addresses_path
    else
       render :edit and return
    end
  end

  def destroy
	  @shipping_address = ShippingAddress.find(params[:id])
	  @shipping_address.destroy
    @shipping_addresses = current_customer.address
    flash.now[:alert] = "配送先を削除しました"
    redirect_to customer_shipping_addresses_path
  end

  private

	def shipping_address_params
  	params.require(:shipping_address).permit(:post_code, :address, :name)
	end
end
