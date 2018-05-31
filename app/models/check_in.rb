class CheckIn < ApplicationRecord
  belongs_to :user
  belongs_to :location

  def all_friends
    user_partner_ids = []
    checkedin_friends = []
    check_ins = CheckIn.all

    current_user.friendships.each do |friendship|
      user_partner_ids << friendship.partner_id
    end

    check_ins.each do |check_in|
      checkedin_friends << check_in.user_id if user_partner_ids.include? check_in.user_id
      # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
      # checkedin_friends << check_in.user_id if user_partner_ids.include? check_in.user_id && Time.nom.utc - check_in.created_at < 1080
    end
    end
    checkedin_friends
  end

  def all_strangers
    user_partner_ids = []
    checkedin_friends = []
    check_ins = CheckIn.all

    current_user.friendships.each do |friendship|
      user_partner_ids << friendship.partner_id
    end

    check_ins.each do |check_in|
      checkedin_friends << check_in.user_id unless user_partner_ids.include? check_in.user_id
      # use next line instead of the one above for time logic (set the time frame for checkins to 3 hours)
      # checkedin_friends << check_in.user_id unless user_partner_ids.include? check_in.user_id || Time.nom.utc - check_in.created_at > 1080
    end
    end
    checkedin_friends
  end
end
