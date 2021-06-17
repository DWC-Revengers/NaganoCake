class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :address
      t.string :postal_code
      t.string :name
      t.integer :payment_method
      t.integer :total_price
      t.integer :shipping
      t.integer :status

      t.timestamps
    end
  end
end
