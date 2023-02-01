class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.find(params[:id])
    @order_details = @orders.order_details
    @total = 0
      @order_details.each do |order_detail|
        @total +=  order_detail.subtotal
      end
    @orders.shipping_cost = 800
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
