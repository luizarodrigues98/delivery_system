Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :transport_types  do
    resources :price_per_weights, only: [:new, :create, :destroy]
    resources :price_per_distances, only: [:new, :create, :destroy]
    resources :arrival_time_configs, only: [:new, :create, :destroy]
    member do  
      post :deactivate
      post :activate
    end
  end
  resources :vehicles do
    get 'search', on: :collection
    member do
      post :active
      post :maintenance
    end
  end
  namespace :admins do
    resources :users
  end
  resources :service_orders do
    member do
      post :delivered 
      post :initiate 
    end
    collection do
      get :pending
      get :in_delivery
      get :finished
    end
  end

end
