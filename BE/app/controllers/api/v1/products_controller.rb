module Api
  module V1
    class ProductsController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_product, only: %i[show update destroy]

      def index
        @product = Product.all
        # @product = Product.paginate(page: params[:page])
        render json: @product, each_serializer: ::Products::ProductSerializer
      end

      def show
        @product = Product.find(params[:id])
        render json: @product
      end

      def create
        @product = Product.create(product_params)
        @product.image.attach(params[:image])

        if @product.valid?
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def update
        if @product.update(product_params)
          render json: @product, each_serializer: nil
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @product.destroy
        render json: {
          message: "deleted"
        }
      end

      private

      def set_product
        @product = Product.includes(:pr_attributes).find(params[:id])
      end

      def product_params
        params.permit(:name, :img, :image)
      end
    end
  end
end
