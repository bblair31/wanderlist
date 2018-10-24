class ReviewsController < ApplicationController
  before_action :require_login
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    if flash[:error]
      params[:country] = flash[:country]
      params[:review] = flash[:review]
    end

    if params[:country] && params[:review] == nil
      @country = Country.find(params[:country])
      @cities = @country.cities.order(:name)
      @review = Review.new
    elsif params[:country] && params[:review]
      @country = Country.find(params[:country])
      @cities = @country.cities.order(:name)
      @review = Review.new(review_params)
    else
      countries = Country.all
      @countries = countries.order(:name)
    end
  end #end new method

  def create
    @review = Review.new(review_params)
    @review.user_id = session[:user_id]
    if @review.save
      redirect_to review_path(@review)
    else
      flash[:error] = @review.errors.full_messages
      flash[:country] = @review.city.country.id
      flash[:review] = params[:review]
      redirect_to new_review_path
    end
  end #end create method

  def edit
    @country = @review.city.country
    @cities = @country.cities.order(:name)
  end

  def update
    @review.update(review_params)
    if @review.valid?
      redirect_to review_path(@review)
    else
      flash[:error] = @review.errors.full_messages
      redirect_to edit_review_path(@review)
    end
  end #end update method

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
