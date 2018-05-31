class Location < ApplicationRecord
  has_many :check_ins
  has_many :users, through: :check_ins

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

  def checkedin_users
    check_ins = self.check_ins
    users = []
    check_ins.each do |check_in|
      users << check_in.user_id
      # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
      # users << check_in.user_id && Time.nom.utc - check_in.created_at < 1080
    end
    users
  end

  def checkedin_friends
    check_ins = self.check_ins
    user_partner_ids = []
    checkedin_friends = []
    current_user.friendships.each do |friendship|
      user_partner_ids << friendship.partner_id
    end
    check_ins.each do |check_in|
      checkedin_friends << check_in.user_id if user_partner_ids.include? check_in.user_id
      # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
      # checkedin_friends << check_in.user_id if user_partner_ids.include? check_in.user_id && Time.nom.utc - check_in.created_at < 1080
    end
    checkedin_friends
  end
end
