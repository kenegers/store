Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :items do
  	member do
  	  post :add_item_to_basket
  	end
  end
  resources :baskets
end
