class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @items = Item.where(id: params[:id])
    @genres = Genre.all
  end

   private
  def genre_params
    params.require(:genre, :item).permit(:name, :image)
  end
end