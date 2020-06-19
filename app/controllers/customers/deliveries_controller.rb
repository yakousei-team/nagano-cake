class Customers::DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    # @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to request.referer
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to customers_deliveries_path
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to customers_deliveries_path
  end

  private
    def delivery_params
      params.require(:delivery).permit(:name, :address, :postcode)
    end
  
end
