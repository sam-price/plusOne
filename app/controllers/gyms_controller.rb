class GymsController < ApplicationController
# simple controller handling the gyms
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
  end
end
