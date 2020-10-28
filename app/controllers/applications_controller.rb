class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    if params[:rating].present?
      @reviews = Review.where(application: @application, rating: params[:rating])
    else
      @reviews = Review.where(application: @application)
    end
  end
end
