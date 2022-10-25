module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorize, only: %i[show update destroy index]
      def index
        @user = User.all
        render json: @user
      end

      def create
        @user = User.create(user_params)

        if @user.valid?
          token = encode_token({ user_id: @user.id })
          response_success(user: @user, token: token)
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def show
        @user = User.find(params[:id])
        token = encode_token({ user_id: @user.id })
        response_success(user: @user, token: token)
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          response_success( user: @user, message: 'Update success')
        else
          response_error(message: 'Password is not in the correct format')
        end
      end

      private

      def user_params
        params.permit(:password, :email)
      end
    end
  end
end
