class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :flight_name
      t.datetime :departure
      t.datetime :arrival
      t.string :source
      t.string :destination
      t.decimal :baggage_allowance
      t.integer :capacity

      t.timestamps
    end
  end
end
