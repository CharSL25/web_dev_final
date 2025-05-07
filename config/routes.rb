Rails.application.routes.draw do
  root "tasks#index"

  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"
  delete "account", to: "users#destroy"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users, only: [ :new, :create ]
  resources :categories
  resources :tasks do
    collection do
      get :completed
    end
  end
end
