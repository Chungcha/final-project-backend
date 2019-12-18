class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :first_name, :last_name, :wait_queue, :future_meetups, :past_meetups

  def future_meetups
    object.meetups.filter{|meetup|Time.parse(meetup.datetime).future?}
  end

  def past_meetups 
    object.meetups.filter{|meetup|Time.parse(meetup.datetime).past?}
  end

end
