class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!
  def show
  	@customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "更新完了しました"
      redirect_to admins_customer_path
    else
      render 'edit'
    end
  end

  private
  def customer_params
  	params.require(:customer).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number,:is_deleted)
  end
end
