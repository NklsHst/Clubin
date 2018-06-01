class CheckIn < ApplicationRecord
  belongs_to :user
  belongs_to :location
  reverse_geocoded_by :latitude, :longitude
  after_save :reverse_geocode, if: ->(obj){ (obj.latitude.present? and obj.latitude_changed?) or (obj.latitude.present? and obj.latitude_changed?) }
end
