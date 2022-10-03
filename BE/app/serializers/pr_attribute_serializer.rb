class PrAttributeSerializer < ActiveModel::Serializer
  attributes :id, :name, :socket, :dimm, :ssd, :hdd, :form, :size, :capacity, :wattage, :price,
             :status

  # def product_name
  #   object.product.name
  # end
  belongs_to :product
end
