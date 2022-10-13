module Api
  module V1
    class PrAttributesController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_product_att, only: %i[show update destroy]

      def index
        product_att = PrAttribute.all
        @pagy, @product_att = pagy(product_att, items: params[:per_page] || DEFAULT_PER_PAGE,
                                                page: params[:page] || DEFAULT_PAGE)

        render json: { page: pages, product_att: @product_att, brand: @product_att.brand_id.count }
      end

      def show
        render json: @product_att, each_serializer: PrAttributeSerializer
      end

      def create
        @product_att = PrAttribute.new(product_att_params)
        @product_att.image.attach(params[:image])
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
        @selected = PrAttribute.where('pr_attributes.id' => params[:case])
                               .or(PrAttribute.where('pr_attributes.id' => params[:cpu]))
                               .or(PrAttribute.where('pr_attributes.id' => params[:main]))
                               .or(PrAttribute.where('pr_attributes.id' => params[:psu]))
                               .or(PrAttribute.where('pr_attributes.id' => params[:cooler]))
                               .or(PrAttribute.where('pr_attributes.id' => params[:ssd]))
                               .or(PrAttribute.where('pr_attributes.id' => params[:ram]))
                               .or(PrAttribute.where('pr_attributes.id' => params[:gpu]))
                               .or(PrAttribute.where('pr_attributes.id' => params[:hdd]))

        render json: @selected
      end

      private

      def set_product_att
        @product_att = PrAttribute.find(params[:id])
      end

      def product_att_params
        params.permit(:product_id, :name, :socket, :dimm, :ssd, :hdd, :form, :size, :capacity,
                      :wattage, :price, :img,:brand_id, :status, :image)
      end
    end
  end
end
