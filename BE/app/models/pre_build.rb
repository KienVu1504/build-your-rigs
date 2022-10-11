class PreBuild < ApplicationRecord
  belongs_to :purpose
  belongs_to :price_range
  validates :cpu, :cooler, :main, :ram, :ssd, :hdd, :gpu, :psw, :case, :price, presence: true

  #post image
  attribute :image_url
  after_find :set_image_url
end
