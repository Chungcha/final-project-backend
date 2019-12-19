require "http"
require "optparse"

RESTAURANTURL = "https://api.yelp.com/v3/businesses/"

class MeetupSerializer < ActiveModel::Serializer

    attributes :users, :restaurantInfo

    def restaurantInfo
        response = HTTP.auth("Bearer #{ENV['yelp_api_key']}").get(RESTAURANTURL+object.restaurant.yelp_id)
        result = response.parse
    end

  end
  