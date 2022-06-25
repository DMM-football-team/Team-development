class CartItemsController < ApplicationController

  before_action :set_cart_item, only: [:update]
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end


  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    cart_item = current_customer.cart_items.find_by(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
