class ReviewTagsController < ApplicationController
  def create
    
    @review = Review.find(params[:review_id])
    @tags = Tag.where(id: params[:review_tag][:tag])

    @tags.each do |tag|
      review_tag = ReviewTag.create!(review: @review, tag: tag)
    end

    redirect_to edit_review_path(@review), notice: 'Your tags were successfully added.'

  end

end
