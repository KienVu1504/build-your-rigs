class Comment < ApplicationRecord
  belongs_to :pr_attribute
  
  validates :body, presence: true
end
