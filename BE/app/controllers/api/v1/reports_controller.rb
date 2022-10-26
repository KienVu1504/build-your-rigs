module Api
  module V1
    class ReportsController < ApplicationController
      def index
        @report = Report.all
        @pagy, report = pagy(@report, items: params[:per_page] || DEFAULT_PER_PAGE,
                                      page: params[:page] || DEFAULT_PAGE)
        response_list(report.order(id: :desc), { each_serializer: ::Reports::ReportSerializer })
      end

      def destroy
        @report = Report.find(params[:id])
        @report.destroy
        response_success(message: 'deleted')
      end

      def update
        @report = Report.find(params[:id])
        @report.update(status: params[:status] || false)
        response_success(report: @report, message: 'Done')
      end

      def create
        @comment_id = Comment.find_by_id(params[:comment_id]).id
        @report = Report.where(comment_id: @comment_id)
        # report = @report.id
        if @report.present?
          response_success(message: 'reported')
        else
          report = Report.new(comment_id: params[:comment_id], reason: params[:reason],
                              status: params[:status] || false)
          if report.save
            response_success(report)
          else
            response_error(report.errors.messages)
          end
        end
      end
    end
  end
end
