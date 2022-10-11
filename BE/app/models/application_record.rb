class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def set_image_url
    return if image.blank?

    self.image_url = Rails.application.routes.url_helpers.url_for(image)
  end
end
