class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(id)
    if message = Message.find_by_id(id)
      ActionCable.server.broadcast('message', message.as_json(include: :user))
    end
  end
end
