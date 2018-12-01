class SessionsController < ApplicationController
  before_action :require_login, except: %i[login create new]
  def login
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
     redirect_to root_path(session[:user_id])
    else
      redirect_to session_login_path
    end
  end

  def logout
    reset_session
    redirect_to root_url
  end
end
