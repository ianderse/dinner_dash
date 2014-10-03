Rails.application.routes.draw do

  root 'welcome#index'

  # post "/items/:id" => "admin/items#update"
  # patch "/items/:id" => "admin/items#update", :as => :admin_post_path

  namespace :admin do
    get '', to: 'dashboard#index'
    resources :items, except: [:index]
  end

  get '/code' => 'welcome#code'
  get '/about' => 'welcome#about'

  resources :items, only: [:index, :show]
  resources :users
  resources :categories
  resources :cart_items, only: [:create]
  get '/about' => 'welcome#about'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
