class DashboardsController < ApplicationController
  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    
    @friends = current_user.active_friends
    @pending = current_user.pending_friend_requests_from.map(&:user)

    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
end
