class PrAttribute < ApplicationRecord
  belongs_to :product
  # post Img
  has_one_attached :image

  validates :name, uniqueness: true, presence: true
  validates :price, presence: true
end
