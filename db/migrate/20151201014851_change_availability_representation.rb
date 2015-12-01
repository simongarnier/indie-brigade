class ChangeAvailabilityRepresentation < ActiveRecord::Migration
  def change
    add_column :availabilities, :per_week, :string, null:true
    add_column :availabilities, :duration, :string, null:true

    Availability.all.each do |availability|
      availability.duration = AvailabilityDuration.find(availability.availability_duration_id).name
      availability.per_week = AvailabilityPerWeek.find(availability.availability_per_week_id).name
      availability.save
    end

    change_column_null :availabilities, :per_week, false
    change_column_null :availabilities, :duration, false

    remove_column :availabilities, :availability_per_week_id
    remove_column :availabilities, :availability_duration_id

    drop_table :availability_durations
    drop_table :availability_per_weeks
  end

  def down
    remove_column :availabilities, :per_week
    remove_column :availabilities, :duration
  end
end
