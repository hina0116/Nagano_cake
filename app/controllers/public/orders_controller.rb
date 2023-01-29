class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to new_public_order_path
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method)
  end

end
