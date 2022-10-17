class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :id_pr_attribute


  def id_pr_attribute
    object.pr_attribute.id
  end
  # belongs_to :pr_attribute
end
