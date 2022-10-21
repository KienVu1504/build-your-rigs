module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authorize, only: :destroy
      before_action :find_commentable, only: :create

      def create
        @comment = @commentable.comments.build(comment_params)
        if @comment.save
          render json: @comment, stauts: :ok
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
        # render json: @commentable
      end

      def index
        @comment = Comment.all
        @pagy, comments = pagy(@comment, items: params[:per_page] || DEFAULT_PER_PAGE,
                                         page: params[:page] || DEFAULT_PAGE)
        render({ meta: pages, json: comments, adapter: :json, each_serializer: CommentSerializer })
      end

      def destroy
        @comment = Comment.find_by(params[:id])
        @comment.destroy
        render json: { message: 'deleted' }
      end

      def show
        @comment = Comment.find_by(params[:id])
        render json: @comment
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
