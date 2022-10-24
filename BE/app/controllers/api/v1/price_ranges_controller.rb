module Api
  module V1
    class PriceRangesController < ApplicationController
      before_action :authorize, only: %i[create update destroy]

      before_action :set_price_range, only: %i[show update destroy]

      def index
        @price_ranges = PriceRange.all
        response_success(@price_ranges)
      end

      def show
        response_success(@price_range)
      end

      def create
        @price_range = PriceRange.new(price_range_params)

        if @price_range.save
          response_success(@price_range)
        else
          response_error(@price_range.errors.messages)
        end
      end

      def update
        if @price_range.update(price_range_params)
          response_success(price_range: @price_range, message: 'Update success')
        else
          response_error(@price_range.errors.messages)
        end
      end

      def destroy
        @price_range.destroy
        response_success(message: 'delete success')
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
