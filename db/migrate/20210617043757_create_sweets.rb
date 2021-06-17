class CreateSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets do |t|
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :unit_price
      t.string :image_id
      t.boolean :sale_status

      t.timestamps
    end
  end
end
