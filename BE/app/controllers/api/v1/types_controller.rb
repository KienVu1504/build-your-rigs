module Api
  module V1
    class TypesController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_type, only: %i[show update destroy]

      # GET /types
      def index
        @types = Type.all
        @users = User.paginate(page: params[:page])
        render json: @types, each_serializer: nil
      end

      # GET /types/1
      def show
        # Select ten cot
        # render json: { type: @type, details: @type.details.select(:name)}
        # render json: { type: @type, details: @type.details }
        # render json: Type.find_by(id: params[:id]), serializer: TypeSerializer

        #  type = Type.find_by(id: params[:id])

        render json: @type, each_serializer: nil
      end

      # POST /types
      def create
        @type = Type.create(type_params)

        if @type.valid?
          render json: @type, status: :created
        else
          render json: @type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /types/1
      def update
        if @type.update(type_params)
          render json: @type
        else
          render json: @type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /types/1
      def destroy
        @type.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_type
        @type = Type.includes(:details).find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def type_params
        params.permit(:name)
      end
    end
  end
end
