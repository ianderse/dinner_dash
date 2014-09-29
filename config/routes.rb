Rails.application.routes.draw do
  root 'welcome#index'

  get '/about' => 'welcome#about'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :items
  resources :users

  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
