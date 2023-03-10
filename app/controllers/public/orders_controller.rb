class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = (cart_item.item.price*1.1).floor
      @order_detail.order_id =  @order.id
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to public_orders_complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @orders = current_customer.orders
    @order_details = @order.order_details
    @total = 0
      @order_details.each do |order_detail|
        @total +=  order_detail.subtotal
      end
    @order.shipping_cost = 800
  end

  def update
    @order = Order.find(params[:id])
    @order.update(address_params)
    redirect_to public_addresses_path
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    if params[:order][:select_address] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    elsif params[:order][:select_address] == "2"
    @order.postal_code = params[:order][:postal_code]
    @order.address = params[:order][:address]
    @order.name = params[:order][:name]
    end
    @order.customer_id = current_customer.id
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shipping_cost, :payment_method, :status, :total_payment, :updated_at, :created_at)
  end

end
