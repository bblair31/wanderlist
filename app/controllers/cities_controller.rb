class CitiesController < ApplicationController
  before_action :require_login
  before_action :find_city, only: [:show]

  def index
    if params[:country]
      @country = Country.find(params[:country])
      @cities = @country.cities.order(:name)
    else
      countries = Country.all
      @countries = countries.order(:name)
    end
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
