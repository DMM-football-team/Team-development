class Admin::OrdersController < ApplicationController
  def index
  		@orders = Order.all
  end

  def current_index
    @orders = Order.where(customer_id: params[:id]).page(params[:page]).per(10)
    render :index
  end

  def today_order_index
    now = Time.current
    @orders = Order.where(created_at: now.all_day).page(params[:page]).per(10)
    render :index

  end

  def show
    @order = Order.find(params[:id])
		@order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
		if @order.update(order_params)
		   flash[:success] = "注文ステータスを変更しました"
		   redirect_to admin_orders_path(@order)
		else
		   render "show"
		end
  end

  private
	def order_params
		  params.require(:order).permit(:status)
	end
end
