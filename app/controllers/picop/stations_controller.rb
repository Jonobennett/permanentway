class Picop::StationsController < Picop::BaseController
  before_action :set_station, only: %i[ show edit update destroy ]

  def index
    @stations = Station.all
  end

  def show
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      redirect_to picop_station_path(@station)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
     if @station.update(station_params)
      redirect_to picop_station_path(@station)
     else
      render :edit, status: :unprocessable_entity
     end
  end

  def edit
  end

  def destroy
    @station.destroy
    redirect_to picop_stations_path
  end

    private
    def set_station
      @station = Station.find(params[:id])
    end

    def station_params
      params.expect(station: [ :name, :crscode, :operator_id ])
    end
end
