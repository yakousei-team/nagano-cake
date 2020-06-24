class CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
    @order = Order.where(customer_id: current_customer.id)
  end

  def confirm
  	@customer = Customer.find(current_customer.id)
  end

  def hide
  	@customer = Customer.find(current_customer.id)
  	if @customer.update(is_deleted:true)
      reset_session

    @customer.update(email:Time.now.strftime('%Y%m%d_%H%M%S').to_s + current_customer.email.to_s)

  	flash[:notice] ="ありがとうございました。またのご利用をお待ちしております。"
  	redirect_to root_path
  end
  end

  def edit
  	@customer = Customer.find(current_customer.id)
  end

  def change
    @customer = Customer.find(current_customer.id)
  end

  def update
  	@customer = Customer.find(current_customer.id)
  	if @customer.update(customer_params)
  		redirect_to customers_path
  	else
  		render 'edit'
    end
  end

  private
  def customer_params
  	params.require(:customer).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number,:is_deleted)
  end

  def screen_customer
  	unless params[:id].to_i == current_customer.id
  		redeirect_to customer_path(current_customer)
  	end
  end
end
