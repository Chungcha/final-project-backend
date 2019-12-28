class User < ApplicationRecord

    has_many :user_meetups
    has_many :meetups, through: :user_meetups

    has_one :wait_queue

    has_one_attached :avatar

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

end
