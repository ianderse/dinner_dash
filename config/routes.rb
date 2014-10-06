Rails.application.routes.draw do
  resources :events

  root 'welcome#index'

  get 'cart/edit'
  patch 'cart/add_item/:item_id', to: 'cart#add_item', as: 'cart_add_item'
  patch 'cart/remove_item/:item_id', to: 'cart#remove_item', as: 'cart_remove_item'
  delete 'cart/destroy'

  namespace :admin do
    get '', to: 'dashboard#index'
    resources :items, except: [:index]
    resources :categories
    resources :users
  end

  get '/code' => 'welcome#code'
  get '/about' => 'welcome#about'

  resources :items, only: [:index, :show]
  resources :users
  resources :categories, only: [:show]
  resources :cart_items, only: [:create]
  get '/about' => 'welcome#about'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
end
