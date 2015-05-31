class CreateAvailabilityDurations < ActiveRecord::Migration
  def change
    create_table :availability_durations do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
