class AvailabilityTableBelongsToAvailability < ActiveRecord::Migration
  def change
      change_table :availabilities do |t|
          t.references :availability_per_week, index: true, foreign_key: true, null: false
          t.references :availability_duration, index: true, foreign_key: true, null: false
          t.remove :per_week
          t.remove :number_of_month
      end
  end
end
