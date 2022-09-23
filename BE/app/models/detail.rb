class Detail < ApplicationRecord
  belongs_to :type

  validates :name, uniqueness: true, presence: true
  validates :price, presence: true
end
