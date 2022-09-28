module Api
  module V1
    class PrAttributesController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_product_att, only: %i[show update destroy]

      # GET /product_att
      def index
        # @product_att = PrAttribute.all
        @product_att = PrAttribute.paginate(page: params[:page], per_page: 50)

        render json: @product_att, each_serializer: nil
      end

      # GET /product_att/1
      def show
        render json: @product_att, each_serializer: PrAttributeSerializer
      end

      # POST /product_att
      def create
        @product_att = PrAttribute.new(product_att_params)
        @product_att.image.attach(params[:pr_attribute][:image])
        if @product_att.save
          render json: @product_att, status: :created
        else
          render json: @product_att.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /product_att/1
      def update
        if @product_att.update(product_att_params)
          render json: @product_att
        else
          render json: @product_att.errors, status: :unprocessable_entity
        end
      end

      # DELETE /product_att/1
      def destroy
        @product_att.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_product_att
        @product_att = PrAttribute.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def product_att_params
        params.permit(:product_id, :name, :socket, :dimm, :ssd, :hdd, :form, :size, :capacity,
                      :wattage, :price, :image, :status)
      end
    end
  end
end
