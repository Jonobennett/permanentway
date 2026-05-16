class StationsController < ApplicationController
  def index
    @stations = Station.includes(:region, :operator).all
  end

  def show
    @station = Station.find_by(crscode: params[:crscode])

    if authenticated?
      @visits = Current.user.visits.where(station: @station)
    end
  end
end
