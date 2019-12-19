Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create]
  resources :wait_queue, only: [:create]
  resources :meetups, only: [:show]
  post "/pastmeetups", to: "meetups#pastmeetups"
  post "/login", to: "auth#create"
  get '/profile', to: "users#profile"
  #am i using this?

end
