Rails.application.routes.draw do
  get "register/new"
  get "register/create"

  devise_for :trainers

  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
