class MeetupsController < ApplicationController

    def show
        @meetup = Meetup.find(params[:id])
        render json: {
            meetup: MeetupSerializer.new(@meetup)
        }
    end

end