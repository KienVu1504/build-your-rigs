class AddDefaultStatusToPurposes < ActiveRecord::Migration[7.0]
  def change
    change_column(:purposes, :status, :boolean, default: true)
    change_column(:price_ranges, :status, :boolean, default: true)


  end
end
