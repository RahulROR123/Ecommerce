
require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
	before context do
		@user = User.create(email: "dassss@gmail.com", password: "123456789", 
		  role: "super_admin") 
		 @category = Category.create(name: "Mobileaa")	
		
	      @product = Product.create(name: "mobile", price: 123, category_id: @category.id, user_id: @user.id)

	     @product_params = {
	     	name: "mobile", price: 123, category_id: @category.id, user_id: 13

	     }
	     @product_params1 = {
	     	name: " ", price: 123, category_id: @category.id, user_id: 13

	     }
	end

   describe 'Create product' do
   	it "Create product" do
	   	request.env["devise.mapping"] = Devise.mappings[:user]
	   	user = @user
	   	sign_in user
	   	post :create, params: {product: @product_params}
	   	 expect(response).to have_http_status(:found)
    end
 
    it 'renders new template on failure' do
		request.env["devise.mapping"] = Devise.mappings[:user]
     user = @user
		 sign_in user
			post :create, params: {product: @product_params1}
		expect(response).to render_template(:new)
    end
   end

   describe 'Show product' do
   	it "show product" do
   		user = @user
		sign_in user
   	get :show, params: {id: @product.id} 
   	 expect(response)
   	end
   end

    describe "Edit product" do
    it "Edit product" do
    	user = @user
		 sign_in user
		get :edit, params: {id: @product.id} 
		expect(response)

     end
    end

    describe 'update' do
    	it 'Update' do
         user = @user
		   sign_in user
		   post :update, params: {id: @product.id, product: {name: "iphone", price: 123, category_id: @category.id, user_id: user.id}}

    	end
    	it 'renders new template on failure' do
    		 user = @user
    		 sign_in user
			 post :update, params: {id: @product.id, product: {name: " ", price: 123, category_id: @category.id, user_id: user.id}} 
      end
    end

    describe 'Destroy' do
    	it 'destroy' do
       user = @user
		  sign_in user
        delete :destroy, params: {id: @product.id} 
		  expect(response)
    	end
    end
end




