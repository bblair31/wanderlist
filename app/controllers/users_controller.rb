class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    if !!params[:user_name]
      @users = User.where("first_name like ?", "%#{params[:user_name]}%").or(User.where("last_name like ?", "%#{params[:user_name]}%"))
    else
      @users = User.all
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      @user.photos << Photo.new(url: 'https://picsum.photos/100/100/?image=101', user_id: @user.id)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end #end create method

  def edit
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end #end update method

  def destroy
    if @user == current_user
    @user.destroy
    redirect_to users_path
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

end ## End of UsersController
