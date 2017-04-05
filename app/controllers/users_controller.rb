class UsersController < ApplicationController
  def index
    # simple logic statement to display results if search is/not made
    # attaching pagnation on and also saying dont display the currunt user who is searching
    if params[:search].present?
      @users = User.where.not(id: current_user).perform_search(params[:search]).paginate(:page => params[:page], :per_page => 5)
    else
      @users = User.all.where.not(id: current_user).paginate(:page => params[:page], :per_page => 5)
    end
# Selecting unique names and ordering them
    @sports = Sport.uniq.pluck(:name)
    @goals = Goal.uniq.pluck(:name)
  end

  def edit
    # finding the user based on the params the rails routes says
    @user = User.find(params[:id])
    @auth = current_user.id

    # To make sure you can't edit someone elses profile
    if @auth != @user.id
      redirect_to @user
    end

    @sports = Sport.all.order(name: :asc)
    @goals = Goal.all.order(name: :asc)
    @gums = Gym.all.order(name: :asc)
    @workouts = Workout.all.order(:name)
    @moments = Moment.all
    @fitness_levels = FitnessLevel.all

  end

  def update
    @user = User.find(params[:id])

# when updating provide a flash message and save
    if @user.update(user_params)
      flash[:notice] = "Settings have been saved succesfully!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
# permitting paramaters to be edited in forms in the users view - for the edit page
  def user_params
    params.require(:user).permit(:fitness_level_id, :moment_id, :workout_id, sport_ids: [], goal_ids: [])
  end
end
