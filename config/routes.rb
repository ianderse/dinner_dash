Rails.application.routes.draw do
  get 'cart/edit'

  patch 'cart/update'

  delete 'cart/destroy'

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

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
end
