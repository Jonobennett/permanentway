class CreateVisits < ActiveRecord::Migration[8.1]
  def change
    create_table :visits do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :station, null: false, foreign_key: true
      t.integer :visit_type
      t.datetime :visit_date

      t.timestamps
    end
  end
end
