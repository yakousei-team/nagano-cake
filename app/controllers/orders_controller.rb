class OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = current_customer.postcode + current_customer.address + current_customer.last_name + current_customer.first_name
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to "infomation"
  end

  def show
  end

  def infomation
  end

  private

  def order_params
      params.require(:order).permit(:address, :postcode, :name, :total_price, :postage, :order_status, :payment_method)
  end

end

