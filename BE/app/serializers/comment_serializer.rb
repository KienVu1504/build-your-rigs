class CommentSerializer < ActiveModel::Serializer
  attributes :body

  belongs_to :pr_attribute
end
