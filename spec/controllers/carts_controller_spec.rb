  
require 'rails_helper'

RSpec.describe CartsController, type: :controller do
    before(:each) do
     @user = create(:user)
     @product = create(:product)
     @cart = create(:cart, user_id: @user.id)
     @cart_items = create(:cart_item, cart_id: @cart.id, product_id: @product.id)
      sign_in @user
    end

   describe 'GET #index' do
    it 'assigns the current user cart to @cart' do
      get :index
      # expect(assigns(:cart)).to eq(@user.cart)
    end
  end

    describe "Destroy" do
     it 'cart_items' do
      user = @user
      sign_in user
      delete :destroy, params: {id: @cart_items.id}
     end
    end

    # describe "Update" do
    #  it 'delete#' do
    #   post :update_cart, params: { cart_id: @cart.id, product_quantity: 2}
    #  end
    # end
end 
