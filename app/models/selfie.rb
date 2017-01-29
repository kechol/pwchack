class Selfie < ApplicationRecord
  belongs_to :room
  mount_uploaders :image, SelfieUploader
end
