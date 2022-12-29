class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :product_quantity
      t.integer :total_price

      t.timestamps
    end
  end
end
