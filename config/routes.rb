Rails.application.routes.draw do
  resources :events

  root 'welcome#index'

  get 'cart/edit'
  patch 'cart/add_item/:id', to: 'cart#add_item', as: 'cart_add_item'
  patch 'cart/remove_item/:id', to: 'cart#remove_item', as: 'cart_remove_item'
  patch 'cart/update_quantity/:id', to: 'cart#update_quantity', as: 'cart_update_quantity'
  delete 'cart/destroy'

  namespace :admin do
    get '', to: 'dashboard#index'
    resources :items, except: [:index]
    resources :categories
    resources :users
    resources :orders, except: [:create, :new]
  end

  resources :items, only: [:index, :show]
  resources :users, except: [:index, :show]
  resources :categories, only: [:show]
  resources :cart_items, only: [:create]
  resources :orders, except: [:update, :edit, :destroy]

  get '/about' => 'welcome#about'
  get '/code' => 'welcome#code'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
end
