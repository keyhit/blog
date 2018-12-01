class CommentsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(user_params)

    respond_to do |format|
        if @comment.save
          format.html { redirect_to all_posts_path, notice: 'Comment was successfully created.' }
        else
          format.html { render new_user_post_comment_path(current_user, post.id) }
        end
    end
  end

  def update
  end

  def destroy
  end
 private



end
