Rails.application.routes.draw do
  # devise_for :users
  

  # get 'categories/show'
  get 'welcome/index'
  devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions", :passwords => "users/passwords",  :confirmations => "users/confirmations"}

  resources :products
  resources :categories
  resources :users
  
  root 'products#index'
end
