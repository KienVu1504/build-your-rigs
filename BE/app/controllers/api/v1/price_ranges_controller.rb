module Api
  module V1
    class PriceRangesController < ApplicationController
      before_action :authorize, only: %i[create update destroy]

      before_action :set_price_range, only: %i[show update destroy]

      def index
        @price_ranges = PriceRange.all

        render json: @price_ranges
      end

      def show
        render json: @price_range
      end

      def create
        @price_range = PriceRange.new(price_range_params)

        if @price_range.save
          render json: @price_range, status: :created
        else
          render json: @price_range.errors, status: :unprocessable_entity
        end
      end

      def update
        if @price_range.update(price_range_params)
          render json: @price_range, status: :ok
        else
          render json: @price_range.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @price_range.destroy
        render json: {
          message: 'delete success'
        }
      end

      private

      def set_price_range
        @price_range = PriceRange.find(params[:id])
      end

      def price_range_params
        params.permit(:price, :status)
      end
    end
  end
end
