class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :name, :commentable_type, :commentable_id, :date_time

  def date_time
    object.created_at.to_datetime.strftime('%a %d %b  %Y')
  end
  # belongs_to :pr_attribute, serializer: ::PrAttributes::ShowCommentSerializer
end
