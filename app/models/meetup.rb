class Meetup < ApplicationRecord

    belongs_to :restaurant

    has_many :user_meetups
    has_many :users, through: :user_meetups

    has_one :chatroom

end
