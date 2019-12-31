class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :first_name, :last_name, :wait_queue, :future_meetups, :past_meetups, :mantra, :occupation
  attribute :avatar, if: -> { object.avatar.attached? }

  def future_meetups
    object.meetups.filter{|meetup|Time.parse(meetup.datetime).future?}
  end

  def past_meetups 
    object.meetups.filter{|meetup|Time.parse(meetup.datetime).past?}
  end

  def avatar
      Rails.application.routes.url_helpers.rails_blob_path(object.avatar, only_path: true)
  end

end
