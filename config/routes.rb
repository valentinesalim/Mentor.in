Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  get 'joincommunity', to: 'pages#joincommunity'
  get 'partner', to: 'pages#partner'


  resources :events do
    resources :appointments, only: [:new,:create]
  end

  resources :appointments, only: [:index, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show,:edit,:update]


end
