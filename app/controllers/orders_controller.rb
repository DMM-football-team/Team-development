class OrdersController < ApplicationController
  def new
    @orders = Order.new
  end

  def log
      @order = Order.new(order_params)
      @orders = current_customer.orders
      @cart_items = current_customer.cart_items.all
      @total_price = @cart_items.inject(0) {|sum, item| sum + item.sum_of_price }
  end

  def create
    @orders = Order.new(order_params)
    @order.current_customer = current_customer.id
    @order.save
    redirect_to orders_log_path
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
