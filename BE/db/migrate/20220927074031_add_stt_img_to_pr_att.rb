class AddSttImgToPrAtt < ActiveRecord::Migration[7.0]
  def change
    add_column :pr_attributes, :status, :boolean, default: true
    add_column :pr_attributes, :img, :string
  end
end
