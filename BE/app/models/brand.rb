class Brand < ApplicationRecord
  has_one_attached :image
  has_many :pr_attributes 
  validates :name, presence: true, uniqueness: true
end
