module Api
  module V1
    class PurposesController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_purpose, only: %i[show update destroy]

      def index
        @purposes = Purpose.all
        response_success(@purposes)
      end

      def show
        response_success(@purpose)
      end

      def create
        @purpose = Purpose.new(purpose_params)

        if @purpose.save
          response_success(@purpose)
        else
          response_error(@purpose.errors.messages)
        end
      end

      def update
        if @purpose.update(purpose_params)
          response_success(purposes: @purposes, message: 'update success')
        else
          response_error(@purpose.errors.messages)
        end
      end

      def destroy
        @purpose.destroy
        response_success(message: 'delete success')
      end

      private

      def set_purpose
        @purpose = Purpose.find(params[:id])
      end

      def purpose_params
        params.permit(:name, :status)
      end
    end
  end
end
