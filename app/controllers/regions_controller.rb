class RegionsController < ApplicationController
  def index
    @regions = Region.order(:name)
  end

  def show
    @region = Region.find(params[:id])
    @stations = Current.user.stations.where(region: @region)
    @unvisited = @region.stations.all.where.not(id: @stations)
  end
end
