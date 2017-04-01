class DashboardsController < ApplicationController
  def index
    session[:conversations] ||= []

    #@users = User.all.where.not(id: current_user)
    @friends = current_user.friendships
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
end
