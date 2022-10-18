module PrAttributes
  class ShowCommentSerializer < ActiveModel::Serializer
    has_many :comments, serializer: CommentSerializer
  end
end
