Rails.application.routes.draw do
  get 'rentals/new'
  get 'rentals/create'
  get 'rentals/edit'
  get 'rentals/update'
  devise_for :users
  root to: 'pages#home'
  resources :decks, only: [:new, :create, :index, :show, :destroy] do
    resources :structures, only: [ :new, :create, :destroy]
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:edit, :update, :show, :destroy]
  resources :cards, only: [:index, :show]
  resources :rentals, only: [:index]
end
