class Message < ApplicationRecord
  belongs_to :user
  belongs_to :recepient, class_name: "User", foreign_key: "recepient_id"
end
