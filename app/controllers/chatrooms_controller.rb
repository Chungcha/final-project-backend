class ChatroomsController < ApplicationController

    def show
        chatroom = Chatroom.find(params[:id])
        render json: chatroom
    end

    

end