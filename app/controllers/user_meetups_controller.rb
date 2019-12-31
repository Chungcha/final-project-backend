class UserMeetupsController < ApplicationController

    def update
        usermeetup = UserMeetup.where(user_id: current_user.id, meetup_id: params[:meetup_id])
        usermeetup.update(attending: params[:attending])

        render json: {meetup: MeetupSerializer.new(usermeetup.first.meetup)}
    end

end