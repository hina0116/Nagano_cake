class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customers = Customer.all
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
end
