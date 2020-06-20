class OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = current_customer.postcode.to_s + current_customer.address.to_s
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to "infomation"
  end

  def show
  end

  def infomation
    if params[:example] == 1
      @address = current_customer.postcode + current_customer.address
    elsif params[:example] == 2
      @address = Delivery
    end


  end

  private

  def order_params
      params.require(:order).permit(:address, :postcode, :name, :total_price, :postage, :order_status, :payment_method)
  end

end

