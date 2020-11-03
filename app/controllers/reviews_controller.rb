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
      redirect_to review_path, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def create
    review = Review.new(review_params)
    if review.save
      render json: { success: true, status: :created }
    else
      render json: { success: false, errors: review.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:status, :user_id, :reviewer_name, :language, :content, :rating, :reviewed_at, :application_id)
  end
end
