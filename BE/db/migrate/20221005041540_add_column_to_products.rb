class AddColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :img, :string
    add_column :pr_attributes, :img, :string
    add_column :pre_builds, :img, :string
  end
end
