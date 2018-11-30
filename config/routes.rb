Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments
    end
  end
  root 'users#index'

  get 'session/login', to: 'sessions#login', as: 'session_login'
  post 'session/create', to: 'sessions#create', as: 'session_create'
  get 'session/logout', to: 'sessions#logout', as: 'session_loguot'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
