Rails.application.routes.draw do
  root 'events#index'

  resources :events, only: [:index, :new]
  resources :registrations, only: [:new]
  resources :sessions, only: [:new, :destroy]
  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
