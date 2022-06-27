class OrdersController < ApplicationController
  def new
    @orders = Order.new
  end

  def log
      @order = Order.new(order_params)
      select_number = params[:order][:address_option].to_i
      if select_number == 1
         @order.post_code = current_customer.post_code
          @order.address = current_customer.address
           @order.name = current_customer.last_name
           @order.name = current_customer.first_name

      elsif select_number == 2
          address = ShippingAddress.find(params[:order][:address_id])
          @order.post_code = address.post_code
          @order.address = address.address
          @order.name = address.name

      elsif select_number == 3
       else
           redirect_to new_customer_order_path(current_customer)
       end

      @cart_items = current_customer.cart_items.all
      @total_price = @cart_items.inject(0) {|sum, item| sum + item.sum_of_price }
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:address, :post_code, :name, :payment_method)
  end

end
