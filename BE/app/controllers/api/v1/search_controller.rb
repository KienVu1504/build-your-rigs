module Api
  module V1
    class SearchController < ApplicationController
      # Custom search serializer

      def search_pr
        q = PrAttribute.ransack(params[:q]).result
        @pagy, @pr = pagy(q, items: params[:per_page] || DEFAULT_PER_PAGE, page: params[:page] || DEFAULT_PAGE)
        response_success(count: @pr.count, meta: pages, data: @pr)
      end

      def search_pre
        q = PreBuild.ransack(params[:q]).result
        @pagy, @pre = pagy(q, items: params[:per_page] || DEFAULT_PER_PAGE, page: params[:page] || DEFAULT_PAGE)
        response_success(count: @pre.count, meta: pages, data: @pre)
      end

      def search_brands
        q = Brand.ransack(params[:q]).result
        @pagy, @brand = pagy(q, items: params[:per_page] || DEFAULT_PER_PAGE, page: params[:page] || DEFAULT_PAGE)
        response_list(@brand, { meta: pages, adapter: :json, each_serializer: BrandSerializer })
      end

      def search_report
        q = Report.ransack(params[:q]).result
        @pagy, @report = pagy(q, items: params[:per_page] || DEFAULT_PER_PAGE, page: params[:page] || DEFAULT_PAGE)
        response_success(count: @report.count, meta: pages, report: @report)
      end

    end
  end
end
