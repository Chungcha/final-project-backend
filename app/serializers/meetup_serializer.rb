require "http"
require "optparse"

RESTAURANTURL = "https://api.yelp.com/v3/businesses/"

class MeetupSerializer < ActiveModel::Serializer

    attributes :users, :restaurantInfo

    def restaurantInfo
        response = HTTP.auth("Bearer #{ENV['yelp_api_key']}").get(RESTAURANTURL+object.restaurant.yelp_id)
        result = response.parse
    end

    def users
        usersArr = []
        object.users.each do |user|
            if user.avatar.attached?
                usersArr << {user: user, avatar: Rails.application.routes.url_helpers.rails_blob_path(user.avatar, only_path: true)}
            else
                usersArr << {user: user, avatar: nil}
            end
        end

        usersArr
    end

  end
  