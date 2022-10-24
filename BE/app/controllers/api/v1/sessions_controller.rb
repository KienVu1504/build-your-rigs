module Api
  module V1
    class SessionsController < ApplicationController
      def login
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
          token = encode_token({ user_id: @user.id })
          response_success(user: @user, token: token)
        else
          response_error(error: 'invalid email or password')
        end
      end
    end
  end
end
