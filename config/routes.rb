Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: "home#index"

   resources :categories
   resources :carts
   resources :products do
    get "/add_to_cart", to: "products#add_to_cart"
   end
end
