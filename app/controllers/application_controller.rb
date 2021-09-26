class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  layout 'user'

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    dashboards_path
  end

  # Overwriting the sign_up redirect path method
  def after_sign_up_path_for(resource_or_scope)
    dashboards_path
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password_confirmation])
  end

  def paging(collection)
    collection.page(params[:page]).per(params[:per_page] || 10)
  end
end
