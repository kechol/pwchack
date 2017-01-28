class Message < ApplicationRecord
  self.inheritance_column = :_type_disabled

  enum type: [:text, :image]
  belongs_to :room

  validates :content, presence: true
  validates :room_id, presence: true
  
  after_create_commit { MessageBroadcastJob.perform_later self }
end
