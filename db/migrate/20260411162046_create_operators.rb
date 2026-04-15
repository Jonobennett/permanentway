class CreateOperators < ActiveRecord::Migration[8.1]
  def change
    create_table :operators do |t|
      t.string :name
      t.integer :stations_count, default: 0

      t.timestamps
    end
  end
end
