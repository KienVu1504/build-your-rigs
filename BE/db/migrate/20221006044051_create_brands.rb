class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :img
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
