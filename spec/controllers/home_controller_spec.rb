 require 'rails_helper'

 RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
   let(:product) {product.create(name: "Test")}
   let(:product1) {product.create(name: "Test")}
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

end