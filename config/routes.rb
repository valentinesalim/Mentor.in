Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :reviews

  resources :events do
    resources :appointments, only: [:create]
  end

  resources :appointments, only: [:index, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
