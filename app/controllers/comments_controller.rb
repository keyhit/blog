class CommentsController < ApplicationController
  before_action :require_login, except: [:index]
  # binding.pry

  def index
    @post_comment = Comment.where(post_id: params[:post_id])
  end

  def show; end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_comments_path(params[:user_id], params[:post_id], params[:id]), notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to user_post_comments_path(params[:user_id], params[:post_id], params[:id]), notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to user_post_comments_path(params[:user_id], params[:post_id], params[:id]), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: params[:user_id], post_id: params[:post_id])
  end
end
