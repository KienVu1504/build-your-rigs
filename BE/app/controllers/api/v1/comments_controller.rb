module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authorize, only: %i[destroy update]
      before_action :find_commentable, only: :create

      def create
        @comment = @commentable.comments.build(comment_params)
        if @comment.save
          render json: @comment, status: :ok
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def index
        @comment = Comment.all.order(id: :desc)
        @pagy, comments = pagy(@comment, items: params[:per_page] || DEFAULT_PER_PAGE,
                                         page: params[:page] || DEFAULT_PAGE)
        render({ meta: pages, json: comments, adapter: :json, each_serializer: ::PrAttributes::ShowCommentSerializer })
      end

      def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: { message: 'deleted' }
      end

      def show
        @comment = Comment.find_by(id: params[:id]) # .comments.order(id: :desc)
        render json: @comment, serializer: ::Comments::ShowIdReportSerializer
      end

      def update
        @comment = Comment.find(params[:id])
        if @comment.update(status: params[:status])
          response_success(comment: @comment, message: 'updated')
        else
          response_error(@comment.errors.messages)
        end
      end

      private

      def find_commentable
        if params[:comment_id]
          @commentable = Comment.find_by_id(params[:comment_id])
        elsif params[:pr_attribute_id]
          @commentable = PrAttribute.find_by_id(params[:pr_attribute_id])
        end
      end

      def comment_params
        params.permit(:body, :name)
      end
    end
  end
end
