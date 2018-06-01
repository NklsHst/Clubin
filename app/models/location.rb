class Location < ApplicationRecord
  has_many :check_ins
  has_many :users, through: :check_ins

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader


  def calculate_average_atmosphere
    check_ins.pluck(:atmosphere_rating).compact.sum / check_ins.count
  end

  def calculate_average_queue
    check_ins.pluck(:queue_rating).compact.sum / check_ins.count
  end

  # def checkedin_users
  #   check_ins
  #   users = []
  #   check_ins.each do |check_in|
  #     users << User.where(id: check_in.user_id)
  #     # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
  #     # users << check_in.user_id && Time.nom.utc - check_in.created_at < 1080
  #   end
  #   users
  # end

  # def checkedin_friends
    # users.joins(:friendships).where('friendships.user_id = ?', current_user.id)
    # check_ins = self.check_ins
    # user_partner_ids = []
    # checkedin_friends = []
    # current_user.friendships.each do |friendship|
    #   user_partner_ids << friendship.partner_id
    # end
    # check_ins.each do |check_in|
    #   checkedin_friends << check_in.user_id if user_partner_ids.include? check_in.user_id
    #   # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
    #   # checkedin_friends << check_in.user_id if user_partner_ids.include? check_in.user_id && Time.nom.utc - check_in.created_at < 1080
    # end
    # checkedin_friends
  # end
end
