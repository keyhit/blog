class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  def icon_size_v
    @icon_size_v = "18px"
  end
  helper_method :icon_size_v

  def icon_size_h
    @icon_size_h = "18px"
  end
  helper_method :icon_size_h

  private

  def require_login
    redirect_to session_login_url unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def posts_comments(params)
    @posts_comments ||= Comment.where(params)
  end
  helper_method :posts_comments

  def chesck_owner
    # binding.pry
    unless current_user.id.to_i == params[:user_id].to_i
      p 'current_user = user_id'
      redirect_to root_path
    end
  end
  helper_method :chesck_owner
end
