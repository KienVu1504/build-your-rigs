module PrAttributes
  class ShowBrandSerializer < ActiveModel::Serializer
    attributes :id, :brand_id, :name, :socket, :dimm, :ssd, :hdd, :form, :size, :capacity, :wattage, :price, :img,
               :status, :image_url, :brand_name

    def brand_name
      object.brand&.name
    end
  end
end
