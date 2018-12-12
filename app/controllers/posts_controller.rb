class PostsController < ApplicationController
  before_action :require_login, except: [:index, :user_post, :show]

  def index
  @posts ||= Post.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json { render json: @all_posts  }
      format.js
    end
  end


  def my_posts
    @my_posts ||= Post.where(user_id: current_user)
  end

  def show
    @post ||= Post.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @post }
      format.js
    end
  end

  def new
    @user = User.find(current_user.id)
    @post = @user.posts.new
    respond_to do |format|
      format.html
      format.json { render json: @post }
      format.js
    end
  end

  def edit
    @user = User.find(current_user.id)
    @post = @user.posts.find(params[:id])
  end

  def create
    # binding.pry
    @post = Post.new(post_params)
    @post.save
    respond_to do |format|
      if 
        format.html { redirect_to user_post_path(params[:user_id], @post.id), notice: 'Post was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        @post = Post.find(params[:id])
        format.html { redirect_to user_post_path(params[:user_id], params[:id]), notice: 'Post was successfully updated.' }
        format.js { render :show }
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
    params.require(:post).permit(:header, :body, :image).merge(user_id: current_user.id)
  end
end
