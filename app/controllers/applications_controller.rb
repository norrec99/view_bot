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

  def index
    if params[:query].present?
      sql_query = "applications.name @@ :query"
      @applications = Application.where(sql_query, query: "%#{params[:query]}%")
    else
      @applications = Application.all
    end
  end

  def create
    @application = Application.new(application_params)
    @application.user = current_user
    if @application.save
      redirect_to @application, notice: 'application was successfully added.'
    else
      render :new
    end
  end

  def new
    @application = Application.new
  end

  private

  def application_params
    params.require(:application).permit(:name)
  end
end
