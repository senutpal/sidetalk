class MessagesController < ApplicationController
  before_action :require_login

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      ActionCable.server.broadcast("chatroom", {
        username: current_user.username,
        body: @message.body,
        created_at: @message.created_at
      })
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
