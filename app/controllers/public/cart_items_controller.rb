class Public::CartItemsController < ApplicationController
  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def index
    @items = Item.all
    @cart_items = Cart_item.all
  end

  def update
    @cart_item = Cart_item.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
