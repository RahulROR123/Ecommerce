require 'rails_helper'
 
 RSpec.describe CategoriesController, type: :controller do

  describe 'GET #index' do
   let(:category) {Category.create(name: "hari")}
   context 'with category details'do
     it 'loads correct user details' do
       # get :index
       get :index
            # expect(response).to have_http_status(200)
            expect(response).to render_template("index")
           # expect(category).to redirect_to(categories_path)     
     end
    end
  end


   describe 'Post #Create' do
     it "return http success" do
      post :create, params: { category: { name: 'category name' } }
      expect(response).to have_http_status(:found)
    end
     it 'renders new template on failure' do
    post :create, params: { category: { name: '' } }
    expect(response).to render_template(:new)
    end
   end

  describe 'GET #show' do
     it "return http success" do
     	 category = Category.create(name: "mobile")
       get :show, params: {id: category.id}
      expect(response).to have_http_status(200)
    end
   end

    describe 'GET #destroy' do
     it "return http success" do
     	@category = Category.create(name: "mobile")
      expect { delete :destroy, params: {id: @category.id} }.to change(Category, :count).by(-1)
      expect(response).to have_http_status(:found)
    end
   end


    describe 'GET #edit' do
     it "return http success" do
     	@category = Category.create(name: "mobile")
      get :edit, params: {id: @category.try(:id)}
      expect(response).to have_http_status(200)
    end
   end


    describe 'GET #update' do
     it "return http success" do
     	category = Category.create(name: "mobile")
      put :update, params: {id: category.id, category: { name: 'category name' } }
      expect(response).to have_http_status(:found)
     end

     it "Render to new" do
        category = Category.create(name: "mobile")
        put :update, params: {id: category.id, category: { name: ' ' } }
        expect(response).to render_template(:edit)
      end
    end
  end





