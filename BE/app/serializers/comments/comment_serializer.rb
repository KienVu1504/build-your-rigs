module Comments
  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :body, :name, :commentable_type, :commentable_id, :date_time, :status

    def date_time
      object.created_at.to_datetime.strftime('%a %d %b  %Y')
    end
    # belongs_to :comment, serializer: CommentSerializer
    has_many :comments, serializer: CommentSerializer
  end
end
