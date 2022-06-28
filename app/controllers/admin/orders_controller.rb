class Admin::OrdersController < ApplicationController
  def index
  		@orders = Order.all
  end

  def show
      @order = Order.find(params[:id])
	  @order_details = @order.order_details
  end

 def update
  	@order = Order.find(params[:id])
  	@order_details = @order.order_details
  	@order.update(order_params)

     if @order.status == "入金待ち"
       @order_details.update_all(status: "着手不可")
 	   elsif @order.status == "入金確認"
	     @order_details.update_all(status: "製作待ち")
	   elsif @order.status == "発送準備中"
			@order_details.update_all(status: "製作中")
			elsif @order.status == "発送済み"
			  @order_details.update_all(status: "製作完了")
			  end
  		 redirect_to  admin_order_path(@order)

  end


  private
	def order_params
		  params.require(:order).permit(:status)
	end
end
