class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
  end

  def create
    binding.pry
  end

  private

  def item_params
      params.require(:item).permit(:item_id, :amount)
  end

end
