class SetDefaultStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :pr_attributes, :status, default: true
    #Ex:- :default =>''
  end
end
