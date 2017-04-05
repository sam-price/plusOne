class LandingsController < ApplicationController
# this allows users who aren't logged in to view the landing pages
  skip_before_action :authenticate_user!

  def index
  end
end
