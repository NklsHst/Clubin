class Location < ApplicationRecord
  has_many :check_ins
  has_many :users, through: :check_ins

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_name,
    against: [ :name],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def calculate_average_atmosphere
    (check_ins.pluck(:atmosphere_rating).compact.sum.to_f / check_ins.count.to_f).round(1) unless check_ins.length == 0
  end

  def calculate_average_queue
    (check_ins.pluck(:queue_rating).compact.sum.to_f / check_ins.count.to_f).round(1) unless check_ins.length == 0
  end
end
