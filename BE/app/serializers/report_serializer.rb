class ReportSerializer < ActiveModel::Serializer
  attributes :id, :comment_id, :comment,:reason, :status, :created_at, :updated_at
end
