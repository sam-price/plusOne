class SearchesController < ApplicationController
  def new
    @search = Search.new
    @sports = Sport.uniq.pluck(:name).sort_by(&:downcase)
    @goals = Goal.uniq.pluck(:name).sort_by(&:downcase)
    @cities = City.distinct.pluck(:name).sort_by(&:downcase)

  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private
  def search_params
    params.require(:search).permit(:sports, :goals, :gyms, :cities)
  end
end