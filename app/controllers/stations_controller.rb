class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def show
    @station = Station.find_by(crscode: params[:crscode])
  end
end
