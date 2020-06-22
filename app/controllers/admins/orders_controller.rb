class Admins::OrdersController < ApplicationController

  def index
  	@orders = Order.all
  end
  	
  def show
  	@order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = 0
  end
  
  def edit
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	@order.save(order_params)
  	redirect_to request.referer
  end

  private

  def order_params
  	params.require(:order).permit(:address, :postcode, :name, :total_price, :postage, :order_status, :payment_method)
  end


end
