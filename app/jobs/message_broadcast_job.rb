# class MessageBroadcastJob < ApplicationJob

#     queue_as :default

#     def perform(message)
#         payload = {
#             room_id: message.chatroom.id,
#             body: message.body,
#             senter: message.sender,
#             participants: message.chatroom.users.collect(&:id)
#             #does this need to be senders
#         }
#         ActionCable.server.broadcast(build_room_id(message.chatroom.id), payload)
#     end

#     def build_room_id(id)
#         "ChatRoom-#{id}"
#     end

# end