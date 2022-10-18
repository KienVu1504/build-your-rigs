class Brand < ApplicationRecord
  has_one_attached :image
  has_many :pr_attributes
  validates :name, presence: true, uniqueness: true
  # add attribute image_url to brand

  attribute :image_url
  after_find :set_image_url
  validate :validate_image, on: :create, if: -> { image.present? }

  # validates :image, attached: true, byte_size: { less_than: 1.megabytes, message: 'is too large' }

  # private

  # def validate_image
  #   # debugger
  #   return errors.add(:image, 'must be a JPEG, JPG or PNG.') unless image.content_type.in?(%w[image/jpeg image/jpg
  #                                                                                         image/png])
  #   return errors.add(:image, 'Image should be less than 1MB') if image.byte_size > 1.megabytes
  # end
end
