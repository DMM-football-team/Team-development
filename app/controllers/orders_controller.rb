class OrdersController < ApplicationController
  def new
    @orders = Order.new
  end

  def log
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
    params.require(:order).permit(:address, :post_code, :name)
  end
end
