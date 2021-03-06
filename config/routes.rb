Rails.application.routes.draw do

  # site root
  root 'welcome#index'

  # about page
  get 'about' => 'welcome#show', as: 'about'

  # user dashboard
  get 'dashboard' => 'dashboard#index'

  # main resources
  get 'parks' => 'parks#index'
  resources :users
  resources :games
  # get 'cancel', to: 'reservations#destroy', as: 'cancel'

  # ActionMailer route for invite email
  get 'invite' => 'games#invite'
  
  # facebook-omniauth routes for login/logout
  get 'auth/facebook' => 'sessions#new', as: 'login'
  get 'auth/facebook/callback' => 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'

 end
