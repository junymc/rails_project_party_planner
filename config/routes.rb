Rails.application.routes.draw do
  
  resources :parties do
    resources :invites
  end
  resources :guests do
    resources :invites
  end
  resources :hosts
  resources :account
  get '/signup' => 'accounts#new'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
