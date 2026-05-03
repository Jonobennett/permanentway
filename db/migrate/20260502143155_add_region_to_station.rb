class AddRegionToStation < ActiveRecord::Migration[8.1]
  def change
    add_reference :stations, :region, null: false, foreign_key: true, default: 1
  end
end
