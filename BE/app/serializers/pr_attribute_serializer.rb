class PrAttributeSerializer < ActiveModel::Serializer
  attributes :id, :brand_id, :name, :socket, :dimm, :ssd, :hdd, :form, :size, :capacity, :wattage, :price, :img,
             :status
  class CommentSerializer < ActiveModel::Serializer
    attributes :body

    belongs_to :pr_attribute
  end

  # def product_name
  #   object.product.name
  # end
  has_many :comments
  belongs_to :product
  # belongs_to :brand
end
