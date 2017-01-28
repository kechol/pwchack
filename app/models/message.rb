class Message < ApplicationRecord
  serialize :content, JSON
  belongs_to :room

  validates :room_id, presence: true
  validates :intent, presence: true

  after_create_commit { MessageBroadcastJob.perform_later self }
end
