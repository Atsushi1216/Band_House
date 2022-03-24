class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後の遷移先
  def after_sign_in_path_for(*)
    musics_path
  end

  protected

# 下記のparameterを追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
    devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
  end
end
