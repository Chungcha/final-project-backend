class MessagesChannel < ApplicationCable::Channel
    def subscribed
        chatroom = Chatroom.find(1)
        stream_for chatroom
    end

    def unsubscribed
    end
end