class MessagesController < ApplicationController

    # skip_before_action :authorized, only: [:create]

    def create
        message = Message.new(body: message_params[:body], user_id:current_user.id, chatroom_id: 1)
        chatroom = Chatroom.find(1)
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