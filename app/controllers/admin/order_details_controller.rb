class Admin::OrderDetailsController < ApplicationController
  def update
		@order_detail = OrderDetail.find(params[:id])
		@order = @order_detail.order
		@order_detail.update(order_detail_params)

   if  @order_detail.status == "着手不可"
		   @order.update(status: "入金待ち")
	    elsif @order_detail.status == "製作待ち"
				@order.update(status: "入金確認")
			elsif @order_detail.status == "製作中"
			  @order.update(status: "製作中")
			elsif @order_detail.status == "製作完了"
				@order.update(status: "発送準備中")
		  end
		  redirect_to admin_order_path(@order_detail.order)
	 end

   private

  def order_detail_params
		  params.require(:order_detail).permit(:status)
  end
end
