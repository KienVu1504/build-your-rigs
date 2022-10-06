class AddColumnToPrAttribute < ActiveRecord::Migration[7.0]
  def change
    add_column :pr_attributes, :brand_id, :integer,  nul: false
  end
end
