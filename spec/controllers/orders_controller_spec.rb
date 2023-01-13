require 'rails_helper'

 RSpec.describe OrdersController, type: :controller do
  before(:each) do
    @user = create(:user)
    @product1 = create(:product)
    @product2 = create(:product)
    @product3 = create(:product)
     cart = create(:cart,  user_id: @user.id)
     cart_items = create(:cart_item, cart_id: cart.id, product_id: @product2.id)
     price = cart.total_price * 100   
     @order = create(:order, user_id: @user.id, total_price: price.to_i, total_quantity: cart.total_quantity)
      @order_items = create(:order_item, order_id: @order.id, product_id: cart_items.product_id, total_price: cart_items.total_price, product_quantity: cart_items.product_quantity)
      sign_in @user
      order = Razorpay::Order.create(amount: price.to_i, currency: 'INR', receipt: 'TEST')
              @order.update(razorpay_order_id: order.id)
      
        @order.update(razorpay_payment_id: "wqsfscdcsaZv")
  end

  describe 'Post #Create' do
    it 'assigns the current user cart to ' do
      post :create_order 
      expect(response)
    end
  end

   describe 'GET #index' do
    it 'assigns the current user order_items to ' do
      get :index
      expect(response)
    end
  end

   describe 'Get #Pay' do
    it 'Pay ' do
      user = @user
      sign_in @user
      get :pay, params: {order_id: @order.id}
      expect(response)
    end
  end


   describe 'Get #show' do
    it 'Show ' do
      get :show, params: {id: @order_items.id}
       expect(response)
    end
  end

  
  #  describe 'Get #update_order' do
  #   it 'Update ' do
  #     debugger
  #     put :update_order, params: {id: @order.id}
  #     # expect(response)
  #     debugger
  #   end
  # end

 end

