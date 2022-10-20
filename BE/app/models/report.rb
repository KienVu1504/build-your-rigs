class Report < ApplicationRecord
  belongs_to :comment

  validates :reason, presence: true
end
