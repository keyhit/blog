class PostsController < ApplicationController
  before_action :require_login, except: [:index, :user_post, :show]

  def index
  @all_posts = Post.all
  end

  def all_user_posts
    @all_user_posts = Post.where(user_id: params[:id])
  end

  def my_posts
    @my_posts = Post.where(user_id: current_user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_path(params[:user_id], @post.id), notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to user_post_path(params[:user_id], params[:id]), notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to all_posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def post_params
    params.require(:post).permit(:header, :body, :image).merge(user_id: params[:user_id])
  end
end
