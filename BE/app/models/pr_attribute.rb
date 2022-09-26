class PrAttribute < ApplicationRecord
  belongs_to :product

  validates :name, uniqueness: true, presence: true
  validates :price, presence: true
end
