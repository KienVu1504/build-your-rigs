module Api
  module V1
    class SessionsController < ApplicationController
      def login
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
          token = encode_token({ user_id: @user.id })
          render json: { user: @user, token: token }, status: :ok
        else
          render json: { error: 'invalid email or password' }, status: :unprocessable_entity
        end
      end
    end
  end
end
