class User < ApplicationRecord

    has_many :user_meetups
    has_many :meetups, through: :user_meetups

    has_one :wait_queue

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

end
