Rails.application.routes.draw do
  get 'rentals/new'
  get 'rentals/create'
  get 'rentals/edit'
  get 'rentals/update'
  devise_for :users
  root to: 'pages#home'
  resources :decks, only: [:new, :create, :index, :show] do
    resources :rentals, only: [:new, :create, :index]
  end
  resources :rentals, only: [:edit, :update, :show]
end
