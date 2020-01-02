class ChatroomsController < ApplicationController

    before_action :authorized

    def show
        chatroom = Chatroom.find(params[:id])
        render json: chatroom
    end

    

end