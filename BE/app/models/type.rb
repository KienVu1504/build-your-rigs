class Type < ApplicationRecord
    has_many :details

    validates :name, uniqueness: true, presence: true
end

