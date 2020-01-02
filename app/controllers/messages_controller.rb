class MessagesController < ApplicationController

    before_action :authorized

    def create
        message = Message.new(body: message_params[:body], chatroom_id:message_params[:chatroom_id], user_id:message_params[:user_id])
        chatroom = Chatroom.find(message_params[:chatroom_id])
        if message.save
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
              MessageSerializer.new(message)
            ).serializable_hash
            MessagesChannel.broadcast_to chatroom, serialized_data
            head :ok
        end
            
    end

    private

    def message_params
        params.require(:message).permit(:body, :chatroom_id, :user_id)
    end

end