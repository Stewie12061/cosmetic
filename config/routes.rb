Rails.application.routes.draw do
  get 'orders', action: :index, controller: :orders
  resources :products
  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root 'home#index'
end
