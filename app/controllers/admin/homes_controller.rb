class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
    @order_details = @order.order_details
  end
end
