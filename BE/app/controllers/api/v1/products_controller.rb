module Api
  module V1
    class ProductsController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_product, only: %i[show update destroy]

      def index
        @product = Product.all
        # @product = Product.paginate(page: params[:page])
        render json: @product, each_serializer: ProductSerializer
      end

      def show
        @product = Product.find(params[:id])
        render json: @product, each_serializer: nil
      end

      def create
        @product = Product.create(product_params)

        if @product.valid?
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def update
        if @product.update(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @product.destroy
      end

      private

      def set_product
        @product = Product.includes(:pr_attributes).find(params[:id])
      end

      def product_params
        params.permit(:name, :image)
      end
    end
  end
end
