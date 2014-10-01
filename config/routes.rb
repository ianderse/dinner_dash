Rails.application.routes.draw do

  root 'welcome#index'

  get '/code' => 'welcome#code'
  get '/about' => 'welcome#about'

  resources :items
  resources :users
  resources :categories
  resources :cart_items, only: [:create]
  get '/about' => 'welcome#about'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
