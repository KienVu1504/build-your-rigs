class RemoveColumnReplyAndPrAttributeId < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :pr_attribute_id
    remove_column :comments, :reply_id
  end
end
