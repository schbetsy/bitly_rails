class UsersController < ApplicationController
  include ApplicationHelper

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(create_params)
    if user.save
      reset_session
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      render :new
    end
  end

  def login
    user = User.authenticate(login_params)
    if user
      reset_session
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to root_path
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

  def show
    @url = Url.new
    # user = current_user
    # if user.id != params[:id]
    #   redirect_to root_path
    # else
    #   render :show
    # end
  end

  private
    def create_params
      params.require(:user).permit(:name, :email, :password)
    end

    def login_params
      params.require(:user).permit(:email, :password)
    end
end
