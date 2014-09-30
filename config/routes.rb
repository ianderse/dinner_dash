Rails.application.routes.draw do
  root to: 'users#index'

  resources :items
  resources :users

  get '/about' => 'welcome#about'
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
