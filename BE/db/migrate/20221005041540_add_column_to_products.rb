class AddColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :image, :string
    add_column :pr_attributes, :image, :string
  end
end
