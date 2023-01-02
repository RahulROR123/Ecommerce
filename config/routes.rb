Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: "home#index"

   resources :categories
   resources :carts do
    post "/update_cart", to: "carts#update_cart"
   end
   resources :products do
    get "/add_to_cart", to: "products#add_to_cart"
   end
  resources :orders do
    post 'create_order',to: 'orders#create_order', on: :collection
    get  'pay',to: 'orders#pay',  on: :collection
 end

end
