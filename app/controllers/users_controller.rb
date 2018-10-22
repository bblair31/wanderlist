class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end ## End of UsersController
