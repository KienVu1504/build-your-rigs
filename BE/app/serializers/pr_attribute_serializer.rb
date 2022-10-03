class PrAttributeSerializer < ActiveModel::Serializer
<<<<<<< HEAD
  attributes :id, :name , :socket, :dimm, :ssd, :hdd, :form, :size, :capacity, :wattage, :price, 
=======
  attributes :id, :name , :socket, :dimm, :ssd, :hdd, :form, :size, :capacity, :wattage, :price,
>>>>>>> 5eb2fa6c41e9d8f5029afbaa47b00346024ca66b
  :status

  # def product_name
  #   object.product.name
  # end
  belongs_to :product
end
