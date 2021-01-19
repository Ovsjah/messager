class Message < ApplicationRecord
  belongs_to :user

  validates_presence_of :body

  after_commit :message_broadcast, on: :create

  private

  def message_broadcast
    MessageBroadcastJob.perform_later(id)
  end
end
