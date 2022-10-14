module Api
  module V1
    class PrAttributesController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_product_att, only: %i[show update destroy]

      def index
        product_att = PrAttribute.all
        @pagy, @product_att = pagy(product_att)
        # page = { page: pages, message: "cmm thang hoang"}

        # render json: { page: pages, product_att: @product_att }
        render({ meta: pages, json: @product_att, adapter: :json, each_serializer: PrAttributeSerializer })
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

      def show_items
        @socket = '', @dimm = '', @ssd = '', @hdd = '', @form = '', @capacity = '', @brand_id = ''
        # @scpu = PrAttribute.where(product_id: 2).shuffle

        @scpu = PrAttribute.where(product_id: 1, socket: params[:socket]).shuffle
        @smain = PrAttribute.where(product_id: 3, socket: params[:socket], dimm: params[:dimm], ssd: params[:ssd],
                                   hdd: params[:hhd], form: params[:form], capacity: params[:capacity]).shuffle
        @sram = PrAttribute.where(product_id: 4, dimm: params[:dimm], capacity: params[:capacity]).shuffle
        @scooler = PrAttribute.where(product_id: 2, socket: params[:socket]).shuffle
        @sssd = PrAttribute.where(product_id: 5, ssd: params[:ssd]).shuffle
        @shdd = PrAttribute.where(product_id: 6, hdd: params[:hdd]).shuffle
        @sgpu = PrAttribute.where(product_id: 7, brand_id: params[:brand_id]).shuffle
        @scase = PrAttribute.where(product_id: 8, form: params[:form]).shuffle
        @spsu = PrAttribute.where(product_id: 9, brand_id: params[:brand_id]).shuffle

        # random_items = { cpu: @scpu[0..4], cooler: @scooler[0..4], main: @smain[0..4], ram: @sram[0..4], ssd: @sssd[0..4], hdd: @shdd[0..4], gpu: @sgpu[0..4],
        #   case: @scase[0..4], psu: @spsu[0..4] }
        random_items = (@scpu + @smain + @sram + @scooler + @sssd + @shdd + @sgpu + @scase + @spsu)

        render json: random_items[0..4]

        # render json: @scpu[0..1]
      end

      private

      def set_product_att
        @product_att = PrAttribute.find(params[:id])
      end

      def product_att_params
        params.permit(:product_id, :name, :socket, :dimm, :ssd, :hdd, :form, :size, :capacity,
                      :wattage, :price, :img, :brand_id, :status, :image)
      end
    end
  end
end
