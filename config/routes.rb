Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :searches

  get 'games/most_played', to: 'games#most_played', as: :most_played
  resources :games do
    resources :reviews
  end
  resources :users, only: [:show]
  # root 'games#index'
  root 'games#welcome'
  
end
