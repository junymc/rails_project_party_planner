Rails.application.routes.draw do

  root to: 'welcome#root'
  get '/login' => 'sessions#login'
  
  resources :parties do
    resources :invites
  end
  resources :guests do
    resources :invites
  end
  resources :hosts
  resources :accounts
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
