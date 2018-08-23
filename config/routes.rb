Rails.application.routes.draw do
  # devise_for :users
  

  # get 'categories/show'
  get 'welcome/index'
  devise_for :users, :controllers => 
    { :registrations => "users/registrations", :sessions => "users/sessions", 
    :passwords => "users/passwords",  :confirmations => "users/confirmations"}

  namespace :admin do
    resources :products
  end
  
  namespace :admin do
    resources :categories
  end

  namespace :people do
    resources :products
  end

  namespace :people do
    resources :categories
  end

  resources :products
  resources :categories
  resources :users do
    member do
      patch :update_user
    end
  end
  root 'products#index'
end
