module Api
  module V1
    class BrandsController < ApplicationController
      before_action :authorize, only: %i[create update destroy]

      def create
        @brand = Brand.new(brand_params)
        @brand.image.attach(params[:image])

        if @brand.save
          render json: @brand, status: :created
        else
          render json: @brand.errors.to_hash, stauts: :unprocessable_entity
        end
      end

      def update
        @brand = Brand.find(params[:id])
        if @brand.update(brand_params)
          render json: @brand
        else
          render json: @brand.errors.full_messages, stauts: :unprocessable_entity
        end
      end

      def index
        brand = Brand.all
        @pagy, @brand = pagy(brand, items: params[:per_page] || 20,
                                    page: params[:page] || DEFAULT_PAGE)

        render json: { page: pages, count: @brand.count, brand: @brand }
        # render json: { count: @brand.count, brand: @brand }
      end

      def destroy
        @brand = Brand.find(params[:id])

        @brand.destroy
        render json: { message: 'deleted' }
      end

      def show
        @brand = Brand.find(params[:id])
        render json: @brand
      end

      def count
        brand = Brand.all
        render json: {count:brand.count}
      end

      def all_brand
        brand = Brand.all
        render json: brand
      end



      def brand_params
        params.permit(:name, :img, :status, :image)
      end
    end
  end
end
