class RenameTableDetails < ActiveRecord::Migration[7.0]
  def change
    rename_table :details, :pr_attributes
  end
end
