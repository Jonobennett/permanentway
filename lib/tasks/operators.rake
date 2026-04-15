desc "Import a csv of operators"
task import_operators: [ :environment ] do
  require "csv"

  CSV.foreach("operators.csv", headers: true) do |row|
    # Station.create!(row.to_hash)
    @station = Station.find_by(crscode: row.fields(0))
    @operator = Operator.find_by(name: row.fields(1))
    @station.operator = @operator
    @station.save
  end
end
