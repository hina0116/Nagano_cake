class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customers = Customer.all
  end

  def complete
  end

  def index
  end

  def show
  end
end
