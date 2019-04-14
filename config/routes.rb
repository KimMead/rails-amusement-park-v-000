Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homepage#homepage'

  resources :users, only: [:new, :create, :show]
  resources :attractions
  
  # get '/signup', to: 'users#new'
  # post 'signup', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/rides', to: 'rides#create'

end
