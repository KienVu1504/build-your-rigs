module Api
  module V1
    class ProductsController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_product, only: %i[show update destroy]

      # GET /product
      def index
        # @product = Product.all
        @users = Product.paginate(page: params[:page])
        render json: @product, each_serializer: ProductSerializer
      end

      # GET /products/1
      def show
        # Select ten cot
        # render json: { type: @type, details: @type.details.select(:name)}
        # render json: { type: @type, details: @type.details }
        # render json: Type.find_by(id: params[:id]), serializer: TypeSerializer

        #  type = Type.find_by(id: params[:id])
        @product = Product.find(params[:id])
        render json: @product, each_serializer: nil
      end

      # POST /types
      def create
        @product = Product.create(product_params)

        if @product.valid?
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /types/1
      def update
        if @product.update(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # DELETE /types/1
      def destroy
        @product.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.includes(:pr_attributes).find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def product_params
        params.permit(:name)
      end
    end
  end
end
