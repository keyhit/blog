class PostsController < ApplicationController
  before_action :require_login, except: [:index, :user_post]

  def index
  @all_posts = Post.all
  end

  def all_user_posts
    @all_user_posts = Post.find_by(user_id: params[:id])
  end

  def my_posts
    @my_posts = Post.where(user_id: current_user)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
