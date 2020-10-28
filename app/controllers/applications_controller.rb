class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def index
    if params[:query].present?
      sql_query = "applications.name @@ :query"
      @applications = Application.where(sql_query, query: "%#{params[:query]}%")
    else
      @applications = Application.all
    end
  end
end
