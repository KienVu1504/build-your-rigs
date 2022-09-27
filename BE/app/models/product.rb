class Product < ApplicationRecord
  has_many :pr_attributes
  # self.per_page = 3

  validates :name, uniqueness: true, presence: true
end
