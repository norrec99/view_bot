class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @location_options = Review.where(application: @application).map(&:location).uniq
    @language_options = Review.where(application: @application).map(&:language).uniq
    @reviewed_at_options = Review.where(application: @application).map(&:reviewed_at).uniq
    if params[:rating].present?
      @reviews = Review.where(application: @application, rating: params[:rating])
    elsif params[:location].present?
      @reviews = Review.where(application: @application, location: params[:location])
    elsif params[:language].present?
      @reviews = Review.where(application: @application, language: params[:language])
    elsif params[:reviewed_at].present?
      @reviews = Review.where(application: @application, reviewed_at: params[:reviewed_at])
    else
      @reviews = Review.where(application: @application)
    end
  end
end
