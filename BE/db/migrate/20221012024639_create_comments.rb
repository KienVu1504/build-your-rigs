class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :pr_attribute, null: false, foreign_key: true
      t.boolean :status, default: true
      t.bigint :reply_id

      t.timestamps
    end
  end
end
