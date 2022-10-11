Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :transport_types  do
    resources :price_per_weights, except: [:index, :show, :edit, :update]
    resources :price_per_distances, except: [:index, :show, :edit, :update]
    member do  
      post :deactivate
      post :activate
    end
  end
  resources :vehicles do
    member do  
      post :active
      post :maintenance
    end
  end
  namespace :admins do
    resources :users
  end
end
