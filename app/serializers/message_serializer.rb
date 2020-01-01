class MessageSerializer < ActiveModel::Serializer
    attributes :id, :body, :user
end