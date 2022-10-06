class Brand < ApplicationRecord
  has_many :pr_attributes
  validates :name, presence: true, uniqueness: true
end
