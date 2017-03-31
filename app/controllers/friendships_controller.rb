class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:create]
  before_action :set_friendship, only: [:destroy, :accept]

# Action to create a new friendship request between to users
  def create
    @friendship = current_user.request_friendship(@user)
    respond_to do |format|
      format.html {redirect_to users_path, notice: "Your friend request has been sent"}
    end
  end

# Custom route for accepting friendships
  def accept
    @friendship.accept_friendship
    respond_to do |format|
      format.html {redirect_to users_path, notice: 'You are now friends'}
    end
  end

# Action to cancel the friendship
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html {redirect_to users_path, notice: 'You have successfully removed your friend'}
    end
  end

  private

# Finds the user
  def set_user
    @user = User.find(params[:user_id])
  end

# Finds the friendship
  def set_friendship
    @friendship = Friendship.find(params[:id])
  end
end
