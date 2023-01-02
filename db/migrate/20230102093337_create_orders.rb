class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total_price
      t.string :total_quantity

      t.timestamps
    end
  end
end
