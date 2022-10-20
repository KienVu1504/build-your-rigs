module Api
  module V1
    class SearchController < ApplicationController
      # Custom search serializer

      def search_pr
        q = PrAttribute.ransack(params[:q]).result
        @pagy, @pr = pagy(q, items: params[:per_page] || DEFAULT_PER_PAGE, page: params[:page] || DEFAULT_PAGE)

        render json: { count: @pr.count, page: pages, data: @pr }
      end

      def search_pre
        q = PreBuild.ransack(params[:q]).result
        @pagy, @pre = pagy(q, items: params[:per_page] || DEFAULT_PER_PAGE, page: params[:page] || DEFAULT_PAGE)

        render json: { count: @pre.count, page: pages, data: @pre }
      end

      def search_brands
        q = Brand.ransack(params[:q]).result
        @pagy, @brand = pagy(q, items: params[:per_page] || DEFAULT_PER_PAGE, page: params[:page] || DEFAULT_PAGE)

        meta = { count: @brand.count, page: pages }
        render({ meta: meta, json: @brand, adapter: :json, each_serializer: BrandSerializer })
      end

      def search_comments
        q = Comment.ransack(params[:q]).result
        @pagy, @comment = pagy(q, items: params[:per_page] || DEFAULT_PER_PAGE, page: params[:page] || DEFAULT_PAGE)

        render json: { count: @comment.count, page: pages, brand: @comment }
      end

      def search_report
        q = Report.ransack(params[:q]).result
        @pagy, @report = pagy(q, items: params[:per_page] || DEFAULT_PER_PAGE, page: params[:page] || DEFAULT_PAGE)

        render json: { count: @report.count, page: pages, report: @report }
      end

    end
  end
end
