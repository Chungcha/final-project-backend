require "http"
require "optparse"

URL = "https://api.yelp.com/v3/businesses/search"
RESTAURANTURL = "https://api.yelp.com/v3/businesses/"

class RestaurantsController < ApplicationController

    def self.generate(cuisine)
        
        params= {
            term: cuisine,
            location: "Washington DC",
            limit: 30
        }

        response = HTTP.auth("Bearer #{ENV['yelp_api_key']}").get(URL, params: params)
        results=response.parse["businesses"]
        
        id = results.sample["id"]
        
        response = HTTP.auth("Bearer #{ENV['yelp_api_key']}").get(RESTAURANTURL+id)
        result = response.parse
        restaurant = Restaurant.create(yelp_id: result["id"])

        meetup = Meetup.create(restaurant_id:restaurant.id, datetime:DateTime.now.advance(days: 1).middle_of_day.advance(hours: 6))
        #find a better way of advancing to 6pm of the next day

        WaitQueue.where(food_choice:cuisine).each do |waitqueueObj| UserMeetup.create(user_id: waitqueueObj.user_id, meetup_id:meetup.id)
            waitqueueObj.destroy
        end

        return result
    end

end