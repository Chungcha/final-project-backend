class ChatroomsController < ApplicationController

    def show
        # chatroom = Chatroom.find(params[:chatroom_id])
        chatroom = Chatroom.find(1)
        render json: chatroom
    end

    

end