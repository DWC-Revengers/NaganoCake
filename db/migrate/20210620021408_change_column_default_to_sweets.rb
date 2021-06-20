class ChangeColumnDefaultToSweets < ActiveRecord::Migration[5.2]
  def change
    change_column_default :sweets, :sale_status, from: false, to: true
  end
end
