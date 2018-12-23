class PostsController < ApplicationController
  before_action :require_login, except: %w[index show]
  before_action :chesck_owner, only: %w[edit destroy]

  def index
    @posts ||= Post.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def my_posts
    @posts ||= Post.where(user_id: current_user).order(created_at: :desc)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @post ||= Post.find(params[:id])
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @post }
    end
  end

  def new
    @user = User.find(current_user.id)
    @post = @user.posts.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @user = User.find(current_user.id)
    @post = @user.posts.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.js
      else
        format.js
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        @post = Post.find(params[:id])
        format.js { render :show }
      else
        format.js
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:header, :body, :image).merge(user_id: current_user.id)
  end
end


