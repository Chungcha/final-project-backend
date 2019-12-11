class Meetup < ApplicationRecord

    belongs_to :restaurant

    has_many :user_meetups
    has_many :users, through: :user_meetups

end
