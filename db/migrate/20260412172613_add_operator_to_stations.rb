class AddOperatorToStations < ActiveRecord::Migration[8.1]
  def change
    add_reference :stations, :operator, foreign_key: true
  end
end
