class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0
  end
end
