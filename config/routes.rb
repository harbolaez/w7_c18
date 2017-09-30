Rails.application.routes.draw do

  root "albums#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :albums do
    resources :photos
  end

  resources :users, except: [:index]
end