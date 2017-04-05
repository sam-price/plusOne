class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # authenticating the user so only certain pages are accessible
  before_action :authenticate_user!

  # Creates a custom path for after the sign in - Allowing for Users to change
  # their exercise preferences
  # Redirecting if people haven't set up their profile or if it's the first time
  # otherwise they will be directed to root
  def after_sign_in_path_for(_resource)
    if current_user && current_user.sign_in_count == 1
      edit_user_path(current_user)
    elsif current_user.sports.empty? || current_user.goals.empty?
      edit_user_path(current_user)
    end
  end

  # Allowing custom parameters for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # These are permitted parameters going through the devise form
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_birth, :gender, :city_id, :bio, gym_ids: []])
  end

end
