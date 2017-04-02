class UsersController < ApplicationController
  def index
if params[:search].present?
  @users = User.perform_search(params[:search]).paginate(:page => params[:page], :per_page => 5)
else
  @users = User.all.paginate(:page => params[:page], :per_page => 5)
end
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

    # Needs sorting into it's own method - don't clutter up the controller
    @weightlifting = Sport.find_by_name('Weightlifting')
    @running = Sport.find_by_name('Running')
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
  end
end
