class DashboardsController < ApplicationController
  def index
    # controller handing dashboards
    session[:conversations] ||= []
    # putting all users that aren't the user signed in into a variable
    @users = User.all.where.not(id: current_user)
    # handling whether friends are active or pending
    @friends = current_user.active_friends
    @pending = current_user.pending_friend_requests_from.map(&:user)

# variable for the conversations 
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
end
