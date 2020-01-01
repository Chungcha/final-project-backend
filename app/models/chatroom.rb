class Chatroom < ApplicationRecord

    has_many :messages, dependent: :destroy
    
    has_many :chatroom_users
    has_many :users, through: :chatroom_users

    belongs_to :meetup

end