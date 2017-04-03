class SearchesController < ApplicationController
  def new
    @search = Search.new
    @sports = Sport.uniq.pluck(:name)
    @goals = Goal.uniq.pluck(:name)
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
