Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments
    end
  end
# binding.pry
  root 'posts#index'
  get 'index', to: 'posts#index', as: 'index'
  get 'my_posts', to: 'posts#my_posts', as: 'my_posts'
  get 'my_draft', to: 'posts#my_draft', as: 'my_draft'
  get 'user_comments/:id', to: 'comments#user_comments', as: 'user_comments'
  get 'post_comments/:id', to: 'comments#post_comments', as: 'post_comments'
  delete 'post_comment_delete/:id', to: 'comments#destroy', as: 'post_comment_delete'
  put 'ban_user/:id', to: 'users#ban_user', as: 'ban_user'
  put 'un_ban_user/:id', to: 'users#un_ban_user', as: 'un_ban_user'


  resources :sessions
  get 'session/login', to: 'sessions#login', as: 'session_login'
  post 'session/create', to: 'sessions#create', as: 'session_create'
  get 'session/logout', to: 'sessions#logout', as: 'session_loguot'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
