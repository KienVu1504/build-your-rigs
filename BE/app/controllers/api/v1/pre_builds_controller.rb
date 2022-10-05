module Api
  module V1
    class PreBuildsController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_pre_build, only: %i[show update destroy]

      def index
        @pre_builds = PreBuild.all
        render json: { count: @pre_builds.count, pre_builds: @pre_builds }
      end

      def show
        render json: @pre_build
      end

      def create
        @pre_build = PreBuild.new(pre_build_params)

        if @pre_build.save
          render json: @pre_build, status: :created
        else
          render json: @pre_build.errors, status: :unprocessable_entity
        end
      end

      def update
        if @pre_build.update(pre_build_params)
          render json: @pre_build
        else
          render json: @pre_build.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @pre_build.destroy
      end

      private

      def set_pre_build
        @pre_build = PreBuild.find(params[:id])
      end

      def pre_build_params
        params.require(:pre_build).permit(:purpose_id, :price_range_id, :cpu, :cooler, :main, :ram, :ssd, :hdd, :gpu,
                                          :psw, :case, :price, :img, :status)
      end
    end
  end
end
