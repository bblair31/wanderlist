class CitiesController < ApplicationController
  before_action :require_login
  before_action :find_city, only: [:show]

  def index
    @cities = City.all
  end

  def show
  end



private

  def find_city
    @city = City.find(params[:id])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end ### End of CitiesController
