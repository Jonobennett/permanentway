desc "Import a csv of stations"
  task import_all: [ :environment ] do
    require "csv"

    CSV.foreach("stationsfull.csv", headers: true) do |row|
      stationhash = row.to_hash
      stationhash["operator"] = Operator.find_by(name: row.field("operator"))
      stationhash["region"] = Region.find_by(name: row.field("region"))
      Station.create!(stationhash)
    end
end
