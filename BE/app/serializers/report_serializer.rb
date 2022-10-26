class ReportSerializer < ActiveModel::Serializer
  attributes :id, :comment_id, :content_comment,:reason, :status, :created_at, :updated_at

  def content_comment
    object.comment
  end
end
