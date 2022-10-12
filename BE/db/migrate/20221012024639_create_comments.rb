class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :pr_attribute, null: false, foreign_key: true
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
