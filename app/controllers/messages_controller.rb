class MessagesController < ApplicationController
  def create
    current_user.messages.create(message_params)
    # ActionCable.server.broadcast('message', @message.as_json(include: :user))
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
