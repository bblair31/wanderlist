class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end

end ## End SessionsController
