Snapup::Application.routes.draw do


  resources :reviews

  get "/home", to: "users#home", as: :user_home
  get "/:instagram_username", to: "users#show", as: :user
  resources :users, except: [:new, :create, :show]

  #*** SESSIONS ***#
  get "oauth/callback", to: "sessions#create", as: :oauth_callback
  delete "logout", to: "sessions#destroy", as: :log_out

  #*** ROOT ***#
  root to: "home#index"
end
