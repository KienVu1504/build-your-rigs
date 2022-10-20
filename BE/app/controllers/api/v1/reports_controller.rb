module Api
  module V1
    class ReportsController < ApplicationController
      def index
        @report = Report.all
        render json: @report
      end

      def destroy
        @report = Report.find(params[:id])
        @report.destroy
        render json: {
          message: 'deleted'
        }
      end

      def update
        @report = Report.find(params[:id])
        @report.update(status: params[:status] || false)
        render json: {
          report: @report, message: 'Done'
        }
      end

      def create
        @comment_id = Comment.find_by_id(params[:comment_id]).id
        @report = Report.where(comment_id: @comment_id)
        # report = @report.id
        if @report.present?
          render json: {
            message: 'reported'
          }
        else
          report = Report.new(comment_id: params[:comment_id], reason: params[:reason],
                              status: params[:status] || false)
          if report.save
            render json: { report: report, message: 'reported' }, status: :created
          else
            render json: report.errors.messages, status: 422
          end

        end
      end
    end
  end
end
