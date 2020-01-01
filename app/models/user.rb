class User < ApplicationRecord

    has_many :user_meetups
    has_many :meetups, through: :user_meetups

    has_one :wait_queue

    has_many :messages

    has_one_attached :avatar

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    has_many :chatroom_users
    has_many :chatrooms, through: :chatroom_users

end
