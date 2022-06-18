class Admin::OrdersController < ApplicationController
  def index
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
  end

  def show
  end

  def update
  end
end
