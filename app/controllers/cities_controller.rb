class CitiesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]
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

end ### End of CitiesController
