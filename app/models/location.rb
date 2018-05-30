class Location < ApplicationRecord
  has_many :checkins

  mount_uploader :photo, PhotoUploader
end
