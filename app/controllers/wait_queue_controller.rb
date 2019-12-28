class WaitQueueController < ApplicationController

    def create 
        listing = WaitQueue.create(user_id: user_params[:id], food_choice: cuisine_params[:value])
        if WaitQueue.where(food_choice:cuisine_params[:value]).length==4
            meetup = RestaurantsController.generate(cuisine_params[:value])

            render json: {meetup: meetup}
        else

        render json: {waitqueue: listing}
        end
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
    end

end