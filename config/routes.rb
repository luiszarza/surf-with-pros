Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  # root to: "listings#index"
  resources :listings do
    resources :bookings
  end
  get "/profile", to: "pages#profile", as: :profile
  get "/home", to: "pages#home", as: :home
end
