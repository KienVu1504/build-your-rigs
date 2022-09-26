module Api
  module V1
    class PrAttributesController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_detail, only: %i[show update destroy]

      # GET /details
      def index
        @details = PrAttribute.all

        render json: @details, each_serializer: nil
      end

      # GET /details/1
      def show
        render json: @detail#, each_serializer: nil
      end

      # POST /details
      def create
        @detail = PrAttribute.new(detail_params)

        if @detail.save
          render json: @detail, status: :created
        else
          render json: @detail.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /details/1
      def update
        if @detail.update(detail_params)
          render json: @detail
        else
          render json: @detail.errors, status: :unprocessable_entity
        end
      end

      # DELETE /details/1
      def destroy
        @detail.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_detail
        @detail = PrAttribute.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def detail_params
        params.permit(:product_id, :name, :socket, :dimm, :ssd, :hdd, :form, :size, :capacity,
                                       :wattage, :price, :img, :status)
      end
    end
  end
end
