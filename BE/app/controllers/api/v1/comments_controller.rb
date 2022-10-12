module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authorize, only: :destroy

      def create
        @comment = Comment.new(comment_params)
        if @comment.save
          render json: @comment, stauts: :ok
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @comment = Comment.find_by(params[:id])
        @comment.destroy
        render json: { message: 'deleted' }
      end

      private

      def comment_params
        params.permit(:body, :pr_attribute_id)
      end
    end
  end
end
