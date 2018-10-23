class CountriesController < ApplicationController
  before_action :require_login
  before_action :find_country, only: [:show]

  def index
    @countries = Country.all
  end

  def show
  end

private

  def find_country
    @country = Country.find(params[:id])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end ### End of CountriesController
