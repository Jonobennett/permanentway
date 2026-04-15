class AddIndexToCrscode < ActiveRecord::Migration[8.1]
  def change
    add_index :stations, :crscode
  end
end
