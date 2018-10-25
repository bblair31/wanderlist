class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Invalid email/password."
      redirect_to login_path
    end
  end #end create method

  def destroy
    session.delete :user_id
    flash[:logout] = "You successfully logged out"
    redirect_to welcome_path
  end

  def welcome
    render :layout => 'welcome'
  end

end ## End SessionsController
