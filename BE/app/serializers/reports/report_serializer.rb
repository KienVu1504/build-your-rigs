module Reports
  class ReportSerializer < ActiveModel::Serializer
    attributes :id, :comment_id, :content_comment, :reason, :status, :date_time

    def content_comment
      object.comment
    end

    def date_time
      object.created_at.to_datetime.strftime('%a %d %b  %Y')
    end
  end
end
