class PortalController < ApplicationController
  def index
    @stations = Current.user.stations
    @unvisited = Station.all.where.not(id: @stations.all)
    total_stations = Station.all.count
    @visit_breakdown = Current.user.visits_breakdown
  end

  def import
  end


  def upload
    require "csv"
    @failed = 0
    @created = 0
    uploaded_file = params[:csv_file]
    if uploaded_file.present?
      csv_data = CSV.parse(uploaded_file.read, headers: true)
      csv_data.each do |row|
        # Process each row of the CSV file
        if row.field("visit_type") && station = Station.find_by(crscode: row.field("crscode")) then
          Visit.create(station: station, visit_type: row.field("visit_type"), user: Current.user, visit_date: row.field("date") || Time.now)
          @created += 1
        else
          @failed += 1
        end
      end
      render "upload"
    end
  end

  def locate
    @stations = Station.all
  end
end
