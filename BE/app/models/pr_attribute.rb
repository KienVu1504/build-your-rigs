class PrAttribute < ApplicationRecord
  belongs_to :product
  belongs_to :brand
  # post Img
  has_one_attached :image

  validates :name, uniqueness: true, presence: true
  validates :price, presence: true

  # post image
  attribute :image_url
  after_find :set_image_url
end
