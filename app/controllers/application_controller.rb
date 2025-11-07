# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :logged_in?, :current_user
  before_action :authorized

  private

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def authorized
    return if logged_in?

    flash[:alert] = 'You must be logged in to access this page.'
    redirect_to login_path
  end
end

