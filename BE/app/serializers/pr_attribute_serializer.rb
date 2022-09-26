class PrAttributelSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_name, :socket, :dimm, :ssd, :hdd, :form, :size, :capacity, :wattage, :price, :img,
             :status

  def product_name
    object.product.name
  end
  # belongs_to :type
end
