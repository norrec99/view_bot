class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    if params[:rating].present?
      @reviews = Review.where(application: @application, rating: params[:rating])
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
