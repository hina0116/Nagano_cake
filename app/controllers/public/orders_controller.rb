class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_details = OrderDetails.new
      @order_details.item_id = cart_item.item_id
      @order_details.tax_included_price = (cart_item.item.price*1.08).floor
      @order_details.order_id =  @order.id
      @order_details.save
    end

    current_customer.cart_items.destroy_all
    redirect_to new_public_order_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
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
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method)
  end

end
