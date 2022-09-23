class PriceRange < ApplicationRecord
    has_many :pre_builds
    validates :price, presence: true
end
