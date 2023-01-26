class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def index
    @items = Item.all
    @cart_items = CartItem.all
    @total = 0
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
