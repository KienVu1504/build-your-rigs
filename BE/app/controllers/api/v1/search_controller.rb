module Api
  module V1
    class SearchController < ApplicationController
      # Custom search serializer

      def search_pr
        @q = PrAttribute.ransack(params[:q])
        @s_name = @q.result
        render json: @s_name, each_serializer: nil
      end

      def search_pre
        @q = PreBuild.ransack(params[:q])
        @s_pre = @q.result
        render json: @s_pre, each_serializer: nil
      end

      def search_brands
        @q = Brand.ransack(params[:q])
        @brand = @q.result
        render json: @brand, each_serializer: nil
      end

      def search_comments
        @q = Comment.ransack(params[:q])
        @cmt = @q.result
        render json: @cmt, each_serializer: nil
      end
    end
  end
end
