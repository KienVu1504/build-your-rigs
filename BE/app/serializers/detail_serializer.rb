class DetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :type_name,  :socket, :dimm, :ssd, :hdd, :form,:size, :capacity, :wattage, :price, :img, :status 
  
  
  def type_name
    object.type.name
  end
  # belongs_to :type
end
