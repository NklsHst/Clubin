class Location < ApplicationRecord
  has_many :check_ins

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader


  def calculate_average_atmosphere
    check_ins = self.check_ins
    check_ins.pluck(:atmosphere_rating).sum/check_ins.length

  end

  def calculate_average_queue
    check_ins = self.check_ins
    check_ins.pluck(:queue_rating).sum/check_ins.length
  end
end
