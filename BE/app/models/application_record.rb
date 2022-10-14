class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def set_image_url
    return if image.blank?

    self.image_url = Rails.application.routes.url_helpers.url_for(image)
  end

  def validate_image
    # debugger
    return errors.add(:image, 'must be a JPEG, JPG or PNG.') unless image.content_type.in?(%w[image/jpeg image/jpg
                                                                                              image/png])
    return errors.add(:image, 'Image should be less than 1MB') if image.byte_size > 1.megabytes
  end
end
