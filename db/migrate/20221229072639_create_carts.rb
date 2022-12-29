class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :total_price
      t.integer :total_quantity

      t.timestamps
    end
  end
end
