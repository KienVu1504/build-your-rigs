module PrAttributes
  class ShowCommentSerializer < ActiveModel::Serializer
    attributes :id

    has_many :comments, serializer: CommentSerializer
  end
end
