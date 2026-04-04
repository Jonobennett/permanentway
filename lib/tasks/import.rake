desc "Import a csv of stations"
task import_csv: [ :environment ] do
require "csv"

CSV.foreach("stations.csv", headers: true) do |row|
  Station.create!(row.to_hash)
end
end
