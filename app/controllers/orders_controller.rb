class OrdersController < ApplicationController
  def index
  	@order = Order.new
  end

  def create
  	@order = Order.new(order_params)
  	@order.save
  	redirect_to request.referer
  end

  def show
  end

  private

  def order_params
      params.require(:order).permit(:address, :postcode, :name, :total_price, :postage, :order_status, :payment_method)
    end

end

