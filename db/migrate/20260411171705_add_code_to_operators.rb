class AddCodeToOperators < ActiveRecord::Migration[8.1]
  def change
    add_column :operators, :code, :string
  end
end
