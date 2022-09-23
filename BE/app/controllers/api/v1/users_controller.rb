

module Api
  module V1
    class UsersController < ApplicationController
      def index
        @user = User.all
        render json: @user
      end
    
      def create
        @user = User.create(user_params)
    
        if @user.valid?
            token = encode_token({ user_id: @user.id })
            render json: { user: @user, token: token }, status: :ok
        else
            render json: { error: ' invalid name or password', user: @user}, status: :unprocessable_entity 
        end
      end
      private
      def user_params
        params.permit(:password, :email)
      end
    

    end
  end

end
