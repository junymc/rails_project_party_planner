Rails.application.routes.draw do

  root to: 'welcome#root'
  get '/login' => 'sessions#login'
  
  resources :guests do
    resources :parties
  end

  resources :hosts do
    resources :parties
  end

  resources :accounts, only: [:new, :create, :edit, :update, :delete]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
