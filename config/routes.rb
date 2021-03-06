Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#root'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure' => 'welcome#root'
  get '/auth_login' => 'welcome#auth_login'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  
  get '/best_host' => 'welcome#best_host'
  
  resources :guests do
    resources :invites
  end

  resources :parties do
    resources :invites
  end

  resources :hosts do
    resources :parties
  end

  resources :accounts, only: [:new, :create]
  resources :parties
  resources :invites
  
  
end
