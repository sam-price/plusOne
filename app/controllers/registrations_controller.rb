class RegistrationsController < Devise::RegistrationsController
# Created my own controller to override devise and add new parameters
  def edit
    # Orders the gyms by name for the user to select
    @gyms = Gym.all.order_by(name: :asc)
  end

  protected

# Redirects the user to their profile after saving settings
    def after_update_path_for(resource)
      user_path(resource)
    end
end
