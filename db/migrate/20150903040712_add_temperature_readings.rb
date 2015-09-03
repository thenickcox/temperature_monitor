class AddTemperatureReadings < ActiveRecord::Migration
  def change
    create_table :temperature_readings do |t|
      t.float :temperature
      t.timestamps
    end
  end
end
