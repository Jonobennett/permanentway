class CreateStations < ActiveRecord::Migration[8.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.string :crscode
      t.float :lat
      t.float :lon
      t.string :country

      t.timestamps
    end
  end
end
