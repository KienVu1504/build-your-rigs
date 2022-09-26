class Type < ApplicationRecord
  has_many :details
  self.per_page = 3

  validates :name, uniqueness: true, presence: true
end
