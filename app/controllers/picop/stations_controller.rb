class Picop::StationsController < Picop::BaseController
  before_action :set_station, only: %i[ show edit update destroy ]

  def index
    @stations = Station.includes(:operator, :region).order(:name)
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

  def import
  end

  def upload
    require "csv"
    @updated = 0
    @created = 0
    uploaded_file = params[:csv_file]
    if uploaded_file.present?
      csv_data = CSV.parse(uploaded_file.read, headers: true)
      csv_data.each do |row|
        # Process each row of the CSV file
        stationhash = row.to_hash
        stationhash["operator"] = Operator.find_by(name: row.field("operator"))
        stationhash["region"] = Region.find_by(name: row.field("region"))
        if (station = Station.find_by(crscode: row.field("crscode"))) then
          station.update!(stationhash)
          @updated += 1
        else
          Station.create!(stationhash)
          @created += 1
        end
        # Rails.logger.info row.inspect
        # <CSV::Row "id":"po_1KE3FRDSYPMwkcNz9SFKuaYd" "Amount":"96.22" "Created (UTC)":"2022-01-04 02:59" "Arrival Date (UTC)":"2022-01-05 00:00" "Status":"paid">
      end
      render "upload"
    end
  end

    private
    def set_station
      @station = Station.find(params[:id])
    end

    def station_params
      params.expect(station: [ :name, :crscode, :operator_id, :region_id, :lat, :lon ])
    end
end
