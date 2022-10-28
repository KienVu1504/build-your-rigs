class Product < ApplicationRecord
  has_many :pr_attributes
  # self.per_page = 3
  has_one_attached :image

  validates :name, uniqueness: true, presence: true
  #post image
  attribute :image_url
  after_find :set_image_url
  validate :validate_image, on: :create, if: -> { image.present? }

end
