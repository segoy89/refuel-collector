class CreateRefuelings < ActiveRecord::Migration[6.0]
  def change
    create_table :refuelings do |t|
      t.references :user, null: false, foreign_key: true
      t.float :liters
      t.decimal :cost
      t.float :kilometers
      t.float :avg_fuel_consumption
      t.string :note

      t.timestamps
    end
  end
end
