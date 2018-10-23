class ReviewsController < ApplicationController
  before_action :require_login
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
    @countries = Country.all
    @cities = City.all
  end

  def create
    @review = Review.create(review_params)
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
    params.require(:review).permit(:rating, :content, :date_visited, :review_date, :user_id, :city_id)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end ### End of ReviewsController
