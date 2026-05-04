desc "Import a csv of regions"
task import_regions: [ :environment ] do
  require "csv"

  CSV.foreach("regions.csv", headers: true) do |row|
    # Station.create!(row.to_hash)
    @station = Station.find_by(crscode: row.fields(0))
    next if @station.nil?
    @region = Region.find_by(name: row.fields(1))
    @station.region = @region
    @station.save
  end
end
