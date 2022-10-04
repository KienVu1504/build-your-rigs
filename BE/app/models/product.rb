class Product < ApplicationRecord
  has_many :pr_attributes
  # self.per_page = 3
  has_one_attached :image

  validates :name, uniqueness: true, presence: true
end
