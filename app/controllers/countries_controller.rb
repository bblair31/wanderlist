class CountriesController < ApplicationController
  skip_before_action :authorized, only: [:index]
  before_action :find_country, only: [:show]

  def index
    @countries = Country.all
  end

  def show
  end

  def analytic
    @top_cities = City.top_5
    @top_countries = Country.top_5
  end

private

  def find_country
    @country = Country.find(params[:id])
  end


end ### End of CountriesController
