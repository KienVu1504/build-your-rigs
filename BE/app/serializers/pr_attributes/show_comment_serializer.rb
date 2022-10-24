module PrAttributes
  class ShowCommentSerializer < ActiveModel::Serializer
    attributes :id, :body, :name, :commentable_type, :commentable_id, :date_time

    def date_time
      object.created_at.to_datetime.strftime('%a %d %b  %Y')
    end

    has_many :comments, each_serializer: ::PrAttributes::ShowCommentSerializer
    # has_many :comments

    def comments
      object.comments.order(id: :desc)
    end
  end
end
