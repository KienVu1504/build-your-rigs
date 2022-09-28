class DeleteColumnImgToPrAttributes < ActiveRecord::Migration[7.0]
  def change
    remove_column :pr_attributes, :img
  end
end
