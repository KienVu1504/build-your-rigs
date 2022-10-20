class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.bigint :comment_id, null: false
      t.text :reason, null: false
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
