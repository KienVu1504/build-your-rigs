class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name
  # def detail_name
  #     object.details.first.name
  # end

  has_many :pr_attributes
end
