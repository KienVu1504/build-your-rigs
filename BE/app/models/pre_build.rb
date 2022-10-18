class PreBuild < ApplicationRecord
  belongs_to :purpose
  belongs_to :price_range
  validates :cpu, :cooler, :main, :ram, :ssd, :hdd, :gpu, :psw, :case, :price, presence: true
 
  #post image
  has_one_attached :image

  attribute :image_url
  after_find :set_image_url
  validate :validate_image, on: :create, if: -> { image.present? }

end
