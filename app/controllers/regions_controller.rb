class RegionsController < ApplicationController
  def index
    @regions = Region.order(:name)
  end

  def show
    @region = Region.find(params[:id])
  end
end
