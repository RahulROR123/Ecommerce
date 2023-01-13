
require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe '#total_price' do
    it 'returns the total price of all items in the cart' do
      cart = Cart.create
      product_1 = Product.create(price: 10)
      product_2 = Product.create(price: 20)

      cart.cart_items.create(product: product_1)
      cart.cart_items.create(product: product_2)
    end
  end
end

