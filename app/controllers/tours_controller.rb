class ToursController < ApplicationController
  before_action :require_login
  before_action :find_tour, only: [:show]

  def index
    @tours = Tour.all
  end

  def show
  end

private

  def find_tour
    @tour = Tour.find(params[:id])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end



end ### End of ToursController
