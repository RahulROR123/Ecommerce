require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#total_price' do
    it 'returns the total price of all items in the cart' do
      order = Order.create
      order_items_1 = OrderItem.create(total_price: 10)
      order_items_2 = OrderItem.create(total_price: 20)

      user = User.create
      order = Order.create(user_id: 1)
     end
  end
end



