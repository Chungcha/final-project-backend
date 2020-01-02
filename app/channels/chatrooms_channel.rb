class ChatroomsChannel < ApplicationCable::Channel

  def subscribed
    # byebug
    if params[:chatroom_id].present?
      # creates a private chat room with a unique name
      stream_from("ChatRoom-#{(params[:chatroom_id])}")
    end
  end

  def unsubscribed
    #unsubscribe is chatroom.message.datetime  is.past? is true
  end

#     # calls when a client connects to the server
#   def subscribed
#     if params[:room_id].present?
#       # creates a private chat room with a unique name
#       stream_from("ChatRoom-#{(params[:room_id])}")
#     end
#   end
  
#   # calls when a client broadcasts data
#   def speak(data)
#     sender    = get_sender(data)
#     room_id   = data['room_id']
#     message   = data['message']

#     raise 'No room_id!' if room_id.blank?
#     chatroom = get_convo(room_id) # A chatroom is a room
#     raise 'No chatroom found!' if chatroom.blank?
#     raise 'No message!' if message.blank?

#     # adds the message sender to the conversation if not already included
#     convo.users << sender unless convo.users.include?(sender)
#     # saves the message and its data to the DB
#     # Note: this does not broadcast to the clients yet!
#     Message.create!(
#       chatroom_id: chatroom,
#       sender_id: sender.id,
#       body: message
#     )
#   end
  
#   # Helpers
  
#   def get_convo(room_code)
#     Chatroom.find_by(room_code: room_code)
#   end
  
# #   def set_sender
# #     User.find_by(guid: id)
# #   end
end