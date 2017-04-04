class UsersController < ApplicationController
  def index
    if params[:search].present?
      @users = User.where.not(id: current_user).perform_search(params[:search]).paginate(:page => params[:page], :per_page => 5)
    else
      @users = User.all.where.not(id: current_user).paginate(:page => params[:page], :per_page => 5)
    end

    # @search = User.search(params[:q])
    # @users = @search.result.joins(:sports).paginate(:page => params[:page], :per_page => 5)
    # @search.build_condition

    @sports = Sport.uniq.pluck(:name)
    @goals = Goal.uniq.pluck(:name)
    #@users = User.all.where.not(id: current_user).search(params[:search]).paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @user = User.find(params[:id])
    @auth = current_user.id

    # To make sure you can't edit someone elses profile
    if @auth != @user.id
      redirect_to @user
    end

    @sports = Sport.all.order(name: :asc)
    @goals = Goal.all.order(name: :asc)
    @workouts = Workout.all.order(:name)
    @moments = Moment.all

  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(sport_ids: [], goal_ids: [])
    params.require(:user).permit(:workout_id, :moment_id)
  end
end
