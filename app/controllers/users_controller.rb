class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create, :profile]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        #need Rails.application.routes.url_helpers
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token}, status: :created
        else
            render json: { error: "failed to create user" }, status: :not_acceptable
        end
    end

    def update
        user = User.find(user_params[:id])
        user.update(first_name: user_params[:first_name], last_name: user_params[:last_name], username: user_params[:username], occupation: user_params[:occupation], mantra: user_params[:mantra])

        render json: { user: UserSerializer.new(user)}, status: :updated
    end

    def updateAvatar
        current_user.update(avatar: params[:avatar])
        render json: { user: UserSerializer.new(current_user) }
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :username, :id, :mantra, :occupation)
    end

end