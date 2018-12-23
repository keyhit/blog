class CommentsController < ApplicationController
  before_action :require_login, except: %i[index post_comments]

  def index
    new_comment
    comments
    respond_to do |format|
      format.html
      format.js
    end
  end

  def user_comments
    @user_comments ||= Comments.where(user_id: params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    new_comment
    comments
    respond_to do |format|
      format.html
      format.js { render :index }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    new_comment
    comments
    respond_to do |format|
      format.html
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: params[:user_id], post_id: params[:post_id])
  end

  def comments
    @comments ||= Comment.where(post_id: params[:post_id]).order(id: :desc)
  end

  def new_comment
    @user = current_user
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.new
  end
end
