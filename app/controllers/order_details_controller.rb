class OrderDetailsController < ApplicationController
  def new
    @order_detail = OrderDetail.new
  end
end
