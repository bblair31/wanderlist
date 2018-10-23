class ReviewsController < ApplicationController
  before_action :require_login
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    if params[:country]
      @country = Country.find(params[:country])
      @cities = @country.cities.order(:name)
      @review = Review.new
    else
      countries = Country.all
      @countries = countries.order(:name)
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = session[:user_id]
    @review.save
    redirect_to review_path(@review)
  end

  def edit
    @countries = Country.all
    @cities = City.all
  end

  def update
    #code
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

private

  def review_params
    params.require(:review).permit(:rating, :content, :date_visited, :user_id, :city_id)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end ### End of ReviewsController
