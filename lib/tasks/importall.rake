desc "Import a csv of stations"
  task import_all: [ :environment ] do
    require "csv"

    CSV.foreach("stationswithoperators.csv", headers: true) do |row|
      stationhash = row.to_hash
      stationhash["operator"] = Operator.find_by(name: row.field("operator"))
      Station.create!(stationhash)
    end
end
