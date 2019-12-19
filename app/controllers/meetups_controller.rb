class MeetupsController < ApplicationController

    def show
        @meetup = Meetup.find(params[:id])
        render json: {
            meetup: MeetupSerializer.new(@meetup)
        }
    end

    def pastmeetups
        # There needs to be stuff here
    end

end