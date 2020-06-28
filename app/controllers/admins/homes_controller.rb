class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
  	@orders = Order.where(created_at: Date.today)
  end

  private

  def order_params #strongパラメータを検討
      params.require(:order).permit(:customer_id, :payment_method, :example, :delivery_id, :address, :postcode, :name, :total_price)
  end

  def correct_customer
    @order = Order.find(params[:id])
    if current_customer.id != @order.customer_id
      redirect_to order_path
    end
  end

end
