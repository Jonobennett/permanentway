class PortalController < ApplicationController
  def index
    @stations = Current.user.stations
    @unvisited = Station.all.where.not(id: @stations.all)
  end

  def missing
  end
end
