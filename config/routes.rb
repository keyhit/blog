Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments
    end
  end

  root 'posts#index'
  get 'index', to: 'posts#index', as: 'index'
  get 'my_posts', to: 'posts#my_posts', as: 'my_posts'
  get 'user_comments/:id', to: 'comments#user_comments', as: 'user_comments'
  get 'post_comments/:id', to: 'comments#post_comments', as: 'post_comments'

  resources :sessions
  get 'session/login', to: 'sessions#login', as: 'session_login'
  post 'session/create', to: 'sessions#create', as: 'session_create'
  get 'session/logout', to: 'sessions#logout', as: 'session_loguot'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
