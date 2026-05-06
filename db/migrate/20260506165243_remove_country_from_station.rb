class RemoveCountryFromStation < ActiveRecord::Migration[8.1]
  def change
    remove_column :stations, :country, :string
  end
end
