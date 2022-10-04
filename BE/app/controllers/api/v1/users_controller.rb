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
          render json: @user.errors.full_messages, status: :unprocessable_entity
        end
      end

      def show
        @user = User.find(params[:id])
        token = encode_token({ user_id: @user.id })
        render json: { user: @user, token: token }, status: :ok
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render json: { user: @user }, status: :ok
        else
          render json: { message: '
            password is not in the correct format', errors: @user.errors.full_messages }, status: 422
        end
      end

      private

      def user_params
        params.permit(:password, :email)
      end
    end
  end
end
