Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :transport_types, only: [:new, :create, :show, :index, :edit, :update] do
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
end
