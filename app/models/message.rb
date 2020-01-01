class Message < ApplicationRecord
    belongs_to :chatroom
    belongs_to :user

    validates_presence_of :body

    # after_create_commit {MessageBroadcastJob.perform_later(self)}

end