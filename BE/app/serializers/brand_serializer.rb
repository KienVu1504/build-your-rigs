class BrandSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :img, :image_url, :count

  def count
    object.pr_attributes.count
  end

  #   has_many :pr_attributes, serializer: PrAttributeSerializer
end
