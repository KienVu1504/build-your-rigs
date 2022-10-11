class Brand < ApplicationRecord
  has_one_attached :image
  has_many :pr_attributes
  # validates :name, presence: true, uniqueness: true
  # add attribute image_url to brand
  attribute :image_url
  after_find :set_image_url

  # private

  # validates :image, file_size: { less_than_or_equal_to: 1.megabytes, message: 'Please Check File Size' },
  #                         file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'],
  #                                              message: 'Please Check File Format' }

  # def set_image_url
  #   return if image.blank?

  #   self.image_url = Rails.application.routes.url_helpers.url_for(image)
  # end
end
