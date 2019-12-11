class AuthController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def create
    end

    private

    def user_login_params
        
    end

end