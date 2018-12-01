class UsersController < ApplicationController
  before_action :require_login, except: %i[create new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      # binding.pry
      if params[:password] == params[:password_confirmation]
        if @user.save
          session[:user_id] = @user.id
          # flash[:success] = 'Successfully Logged In!'
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          # format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          # format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        
      end
    end
  end

  def update
  end

  def destroy
  end
  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end