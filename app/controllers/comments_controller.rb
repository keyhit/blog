class CommentsController < ApplicationController
  before_action :require_login, except: %i[index post_comments]

  def index
    @comments ||= Comment.all
  end

  def user_comments
    @user_comments ||= Comments.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def post_comments
    @post_comments ||= Comment.where(post_id: params[:id]).order(created_at: :desc)
# binding.pry
  @p = @post_comments.map { |k| { id: k.id, text: k.text, avatar: k.user.avatar.versions[:thumb].url, created_at: k.created_at } }
    respond_to do |format|
      format.html
      format.js
      format.json  { render json: @p }
    end


      @user = current_user
      @post = Post.find(params[:id])
      @comment = Comment.new
  end

  def user_comments
    @user_comment ||= Comment.where(user_id: params[:id])
  end

  def show; end

  def new

  end

  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    respond_to do |format|
      format.html 
      format.js 
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
      format.js { render :post_comments}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: params[:user_id], post_id: params[:post_id])
  end
end
