module Api
  module V1
    class PreBuildsController < ApplicationController
      before_action :authorize, only: %i[create update destroy]
      before_action :set_pre_build, only: %i[show update destroy]

      def index
        pre_builds = PreBuild.all
        @pagy, @pre_builds = pagy(pre_builds)
        response_success(page: pages, pre_build: @pre_builds)
      end

      def show
        response_success(@pre_build)
      end

      def create
        @pre_build = PreBuild.new(pre_build_params)
        @pre_build.image.attach(params[:image])

        if @pre_build.save
          response_success(@pre_build, status)
        else
          response_error(@pre_build.errors.messages)
        end
      end

      def update
        if @pre_build.update(pre_build_params)
          response_success(pre_build: @pre_build, message: 'Update success')
        else
          response_error(@pre_build.errors.messages)
        end
      end

      def destroy
        @pre_build.destroy
        response_success(message: "deleted")
      end

      private

      def set_pre_build
        @pre_build = PreBuild.find(params[:id])
      end

      def pre_build_params
        params.permit(:purpose_id, :price_range_id, :cpu, :cooler, :main, :ram, :ssd, :hdd, :gpu,
                      :psw, :case, :price, :img, :status, :image)
      end
    end
  end
end
