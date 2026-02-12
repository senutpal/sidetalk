class ChatroomController < ApplicationController
  def index
    @messages = Message.includes(:user).order(created_at: :asc)
    @users = User.all
  end
end

