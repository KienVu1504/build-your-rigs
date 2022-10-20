class PrAttribute < ApplicationRecord
  belongs_to :product
  belongs_to :brand
  has_many :comments, as: :commentable, dependent: :destroy

  # post Img
  has_one_attached :image

  validates :name, uniqueness: true, presence: true
  validates :price, presence: true

  # post image
  attribute :image_url
  after_find :set_image_url
  validate :validate_image, on: :create, if: -> { image.present? }
end
