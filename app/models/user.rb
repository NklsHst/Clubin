class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :checkins
  has_many :friendships

  mount_uploader :picture, PhotoUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.picture = URI.parse(auth.info.image)
      user.password = Devise.friendly_token[0,20]
      user.friends = auth.user_friends
      # user_friends should work after fb approves
    end
  end

  def apply_omniauth(auth)
    update_attributes(
      provider: auth.provider,
      uid: auth.uid
    )
  end

  def has_facebook_linked?
    self.provider.present? && self.uid.present?
  end
end
