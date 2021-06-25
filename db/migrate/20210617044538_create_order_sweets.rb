class CreateOrderSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :order_sweets do |t|
      t.integer :sweet_id
      t.integer :order_id
      t.integer :amount
      t.integer :making_status
      t.integer :sub_price

      t.timestamps
    end
  end
end
