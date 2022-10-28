module Products
  class ProductForm < BaseForm
    # name: string
    # img: text

    attr_accessor :name, :img, :image

    attribute :image_url
    after_find :set_image_url
    validate :validate_image, on: :create, if: -> { image.present? }

    validates :name, presence: true

    def save
      product = Product.new(attributes)
      product.save
      product
    end

    private

    def attributes
      {
        name: name,
        img: img,
        image: image
      }
    end
  end
end
