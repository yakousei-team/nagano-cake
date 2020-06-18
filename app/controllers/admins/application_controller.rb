class Admins::ApplicationController < ApplicationController
	before_action :configure_permitted_parameters, if: :devise_controller?
	#デバイス機能実行前にconfigure_permitted_parametersの実行をする。
	protect_from_forgery with: :exception

	def after_sign_in_path_for(resource_or_scope)
    admins_top_path
    end
    #sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
    def after_sign_out_path_for(resource_or_scope)
    root_path
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end
