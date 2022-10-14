class PrAttributeSerializer < ActiveModel::Serializer
  attributes :id, :brand_id, :name, :socket, :dimm, :ssd, :hdd, :form, :size, :capacity, :wattage, :price, :img,
             :status

  # def product_name
  #   object.product.name
  # end
  has_many :comments, serializer: CommentSerializer
  belongs_to :product
  # belongs_to :brand
end
