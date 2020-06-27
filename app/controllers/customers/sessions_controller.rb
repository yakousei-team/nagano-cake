# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  before_action :reject_customer, only: [:create]

  protected
  def reject_customer
    customer = Customer.find_by(email: params[:customer][:email], is_deleted: false)
    if customer
      return
    end
    customers = Customer.where(#後方一致しているemailをメールアドレスからとってきている
      "email LIKE ?",
      "%#{params[:customer][:email]}"
    ).where(is_deleted: true)
    if customers.empty?
      flash[:error] = "必須項目を入力してください。"
      return
    end
    #同一アドレスで複数回、登録・退会できるためeachで確認している
    customers.each do |customer|#入力値と取り除いたemailの比較をしている
      email = customer.email.gsub(/^[0-9]{8}_[0-9]{6}/, "")#文字列から退会用定型文を取り除いたもの
      if email == params[:customer][:email]
        flash[:error] = "退会済みです。"
        redirect_to new_customer_session_path
      end
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number,:is_deleted)
  end
end
