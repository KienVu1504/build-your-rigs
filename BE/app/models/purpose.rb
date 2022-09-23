class Purpose < ApplicationRecord
    has_many :pre_builds
    validates :name, presence: true

end
