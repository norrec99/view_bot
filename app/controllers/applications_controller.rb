class ApplicationsController < ApplicationController
  
  def new
    @application = Application.new
  end

  def create
    application = Application.new(application_params)
    if application.save
      render json: { success: true, application_id: application.id }
    else
      render json: { success: false, errors: application.errors.messages }, status: :unprocessable_entity
    end
  end

  def show
    @application = Application.find(params[:id])
    @location_options = Review.where(application: @application).map(&:location).uniq
    @language_options = Review.where(application: @application).map(&:language).uniq
    @reviewed_at_options = Review.where(application: @application).map(&:reviewed_at).uniq
    if params[:rating].present?
      @reviews = Review.where(application: @application, rating: params[:rating]).paginate(:page => params[:page], :per_page=>5)
    elsif params[:location].present?
      @reviews = Review.where(application: @application, location: params[:location]).paginate(:page => params[:page], :per_page=>5)
    elsif params[:language].present?
      @reviews = Review.where(application: @application, language: params[:language]).paginate(:page => params[:page], :per_page=>5)
    elsif params[:reviewed_at].present?
      @reviews = Review.where(application: @application, reviewed_at: params[:reviewed_at]).paginate(:page => params[:page], :per_page=>5)
    else
      @reviews = Review.where(application: @application).paginate(:page => params[:page], :per_page=>5)
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

  private

  def application_params
    params.require(:application).permit(:name, :photo)
  end
end