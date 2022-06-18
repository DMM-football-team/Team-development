class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def show
  end

  def create
    @item = Item.new
  end

  def edit
  end

  def update
  end
end
