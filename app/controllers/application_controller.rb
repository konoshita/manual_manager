class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path 
  end

  def configure_permitted_parameters
    # 管理者用のカラムを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :email, :name, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :role,])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :email, :name, :password])
  end

  private

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
end
