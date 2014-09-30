Rails.application.routes.draw do

  root 'welcome#index'
  get '/code' => 'welcome#code'
  get '/about' => 'welcome#about'
  resources :items

end
