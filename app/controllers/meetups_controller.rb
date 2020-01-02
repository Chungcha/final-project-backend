class MeetupsController < ApplicationController

    skip_before_action :authorized, only: [:show]
    #cant seem to get past auth

    def show
        
        @meetup = Meetup.find(params[:id])
        render json: {
            meetup: MeetupSerializer.new(@meetup)
        }
    end

end