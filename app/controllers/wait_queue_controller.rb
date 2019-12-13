class WaitQueueController < ApplicationController

    def create 
        byebug
        #find the user_id in the wait queue, if exists return waiting?  they should know when logging in there is one waiting.

        #if not, look for 3 other people.  If so, take them all and make the meetup and meetupuser/ restuarant

        #if not, add user to wait list.

    end

    private

    def cuisine_params
    params.require(:cuisine).permit(:value)
    end

    def user_params
    params.require(:user).permit(:id)
endc