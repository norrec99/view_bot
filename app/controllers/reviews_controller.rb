class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    @review_tag = ReviewTag.new
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to root_path, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:status, :user_id)
  end
end
