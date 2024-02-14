class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :render404
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
    devise_parameter_sanitizer.permit(:invite) { |u| u.permit(:email, :name) }
    devise_parameter_sanitizer.permit(:accept_invitation) { |u| u.permit(:password, :password_confirmation, :invitation_token, :name) }
  end

  def render404(error = nil)
    Rails.logger.error("❌#{error.message}") if error
    render template: 'errors/render404', layout: 'devise', status: :not_found
  end

  def check_admin
    unless current_user&.admin? || current_user.role == "editor"
      redirect_to root_path, alert: '権限がありません。'
    end
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
