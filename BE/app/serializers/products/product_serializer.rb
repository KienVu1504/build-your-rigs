module Products
  class ProductSerializer < ActiveModel::Serializer
    attributes :id, :name, :img, :count
    # def detail_name
    #     object.details.first.name
    # end
    def count
      object.pr_attributes.count
    end
    # has_many :pr_attributes
  end
end
