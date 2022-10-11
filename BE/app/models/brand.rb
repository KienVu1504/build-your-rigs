class Brand < ApplicationRecord
  has_one_attached :image
  has_many :pr_attributes
  validates :name, presence: true, uniqueness: true
  # add attribute image_url to brand
  attribute :image_url
  after_find :set_image_url

  # private


  # def set_image_url
  #   return if image.blank?

  #   self.image_url = Rails.application.routes.url_helpers.url_for(image)
  # end
end
