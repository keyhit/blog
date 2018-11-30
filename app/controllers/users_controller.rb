class UsersController < ApplicationController
  before_action :require_login, except: %i[create new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
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
  private

  def set_user
    @user = User.find(session[:user_id])
  end
end
