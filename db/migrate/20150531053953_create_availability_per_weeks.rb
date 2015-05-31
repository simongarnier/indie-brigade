class CreateAvailabilityPerWeeks < ActiveRecord::Migration
  def change
    create_table :availability_per_weeks do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
