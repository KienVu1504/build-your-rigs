module Api
  module V1
    class BrandsController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_brand, only: %i[update destroy show]

      def create
        @brand = Brand.new(brand_params)
        @brand.image.attach(params[:image])

        if @brand.save
          response_success(@brand)
        else
          response_error(error: @brand.errors.to_hash)
        end
      end

      def update
        if @brand.update(brand_params)
          response_success(brand: @brand, status: :ok, message: 'update success')
        else
          response_error(error: @brand.errors.message)
        end
      end

      def index
        brand = Brand.all
        @pagy, @brand = pagy(brand, items: params[:per_page] || 20,
                                    page: params[:page] || DEFAULT_PAGE)

        response_list(@brand, { adapter: :json, count: @brand.count })
      end

      def destroy
        @brand.destroy
        response_success(message: 'deleted')
      end

      def show
        response_success(@brand)
      end

      def count
        brand = Brand.all
        response_success(count: brand.count)
      end

      def all_brand
        brand = Brand.all
        response_success(brand)
      end

      private

      def brand_params
        params.permit(:name, :img, :status, :image)
      end

      def set_brand
        @brand = Brand.find(params[:id])
      end
    end
  end
end
