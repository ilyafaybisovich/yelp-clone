# go away
class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    if @review.save
      redirect_to restaurants_path
    else
      error_redirections
    end
  end

  def review_params
    review_info = params.require(:review).permit(:thoughts, :rating)
    review_info[:user] = current_user
    review_info
  end

  def error_redirections
    if @review.errors[:user]
      redirect_to restaurants_path,
                  alert: "You've already reviewed this restaurant"
    else
      render :new
    end
  end
end
