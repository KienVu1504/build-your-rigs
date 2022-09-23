class PreBuild < ApplicationRecord
  belongs_to :purpose
  belongs_to :price_range
  validates :cpu, :cooler, :main, :ram, :ssd, :hdd, :gpu, :psu, :case, :price, presence: true

end
