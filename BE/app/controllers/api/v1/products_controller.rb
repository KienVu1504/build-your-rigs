module Api
  module V1
    class ProductsController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_product, only: %i[show update destroy]

      def index
        @product = Product.all

      
        render({ meta: @product.count, json: @product, adapter: :json,
                 each_serializer: ::Products::ProductSerializer })
      end

      def show
        @product = Product.find(params[:id])
        response_success(@product)
      end

      def create
        @product = Product.create(product_params)
        @product.image.attach(params[:image])

        if @product.valid?
          response_success(@product)
        else
          response_error(@product.errors.messages)
        end
      end
      # def create
      #   form = Products::ProductForm.new(product_params)
      #   if form.valid?
      #     @product = form.save
      #     response_success(@product)
      #   else
      #     response_error(@product.errors.messages)

      #   end
      # end

      def update
        if @product.update(product_params)
          render json: { product: @product, message: 'Update success' }, status: 200
        else
          rresponse_error(@product.errors.messages)
        end
      end

      def destroy
        @product.destroy
        response_success(message: 'deleted')
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
