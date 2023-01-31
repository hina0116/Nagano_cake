class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
    @order_details = customer.order_details
  end
end
