class ResidentsController < ApplicationController
  def index
    @residents = Resident.all
    @average_age = Resident.avg_age
  end

  def show
    @resident = Resident.find(params[:id])
    @courses = @resident.courses
  end
end