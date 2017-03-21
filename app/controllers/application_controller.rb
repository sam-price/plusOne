class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # Creates a custom path for after the sign in - Allowing for Users to change
  # their exercise preferences
  def after_sign_in_path_for(_resource)
    edit_user_path(current_user)
  end

  # Allowing custom parameters for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_birth])
  end

end
