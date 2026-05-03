class CreateRegions < ActiveRecord::Migration[8.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.string :bounds
      t.integer :stations_count

      t.timestamps
    end
  end
end
