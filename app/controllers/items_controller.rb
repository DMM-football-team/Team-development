class ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  private
	def item_params
		parmas.require(:item).permit(:image ,:name, :explanation, :price, :is_sales_status, :genre_id, :image)
	end

end
