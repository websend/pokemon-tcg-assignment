Rails.application.routes.draw do
  get "register/new"
  get "register/create"

  devise_for :trainers

  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :cards
  resources :card_packs

  resources :trainer, only: [] do
    resources :cards, only: :index
  end
end
