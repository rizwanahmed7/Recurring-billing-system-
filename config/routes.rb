Rails.application.routes.draw do

  root 'users#homepage'
  devise_for :users
  
  resources :plans do
    resources :subscriptions, only: [:show, :create, :new], on: :member 
    resources :features, shallow: true
  end

  resources :features, only: [:show] do
    resources :usages, shallow: true 
  end

  resources :subscriptions, only: [:index] do
    get 'success', on: :collection
  end

  resources :usages, only: [:index]
  resources :transactions, only: [:index]
  
end
  