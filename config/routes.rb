Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments
    end
  end

  root 'posts#index'
  get 'all_posts', to: 'posts#index', as: 'all_posts'
  get 'all_user_posts/:id', to: 'posts#all_user_posts', as: 'all_user_posts'
  get 'my_posts/:id', to: 'posts#my_posts', as: 'my_posts'

  get 'session/login', to: 'sessions#login', as: 'session_login'
  post 'session/create', to: 'sessions#create', as: 'session_create'
  get 'session/logout', to: 'sessions#logout', as: 'session_loguot'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
