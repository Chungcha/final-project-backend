Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :update]
  resources :wait_queue, only: [:create]
  resources :meetups, only: [:show]
  resources :chatrooms, only: [:show, :create]
  resources :messages, only: [:create]
  post '/toggleAttending', to: "user_meetups#update"
  post '/updateAvatar', to: "users#updateAvatar"
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  post "/login", to: "auth#create"
  get '/profile', to: "users#profile"
  mount ActionCable.server => '/cable'
  #am i using this?

end
