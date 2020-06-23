class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	#デバイス機能実行前にconfigure_permitted_parametersの実行をする。
	protect_from_forgery with: :exception


	def after_sign_in_path_for(resource_or_scope)
  if admin_signed_in? && customer_signed_in?
    new_customer_session_path
	elsif admin_signed_in?
		admins_top_path
	else
		admins_top_path
	end
    end
    #sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
    def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end
