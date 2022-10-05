module Api
  module V1
    class PrAttributesController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_product_att, only: %i[show update destroy]

      def index
        @product_att = PrAttribute.paginate(page: params[:page], per_page: 50)

        render json: @product_att, each_serializer: nil
      end

      def show
        render json: @product_att, each_serializer: PrAttributeSerializer
      end

      def create
        @product_att = PrAttribute.new(product_att_params)
        if @product_att.save
          render json: @product_att, status: :created
        else
          render json: @product_att.errors, status: :unprocessable_entity
        end
      end

      def update
        if @product_att.update(product_att_params)
          render json: @product_att
        else
          render json: @product_att.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @product_att.destroy
      end

      def selected
        @cpu = '', @main = '', @psu = '', @cooler = '', @ssd = '', @ram = '', @gpu = '', @hdd = '', @case = ''
        @selected = PrAttribute.where('pr_attributes.id' => @case)
                               .or(PrAttribute.where('pr_attributes.id' => @cpu))
                               .or(PrAttribute.where('pr_attributes.id' => @main))
                               .or(PrAttribute.where('pr_attributes.id' => @psu))
                               .or(PrAttribute.where('pr_attributes.id' => @cooler))
                               .or(PrAttribute.where('pr_attributes.id' => @ssd))
                               .or(PrAttribute.where('pr_attributes.id' => @ram))
                               .or(PrAttribute.where('pr_attributes.id' => @gpu))
                               .or(PrAttribute.where('pr_attributes.id' => @hdd))

        render json: @selected
      end

      private

      def set_product_att
        @product_att = PrAttribute.find(params[:id])
      end

      def product_att_params
        params.permit(:product_id, :name, :socket, :dimm, :ssd, :hdd, :form, :size, :capacity,
                      :wattage, :price, :img, :status)
      end
    end
  end
end
