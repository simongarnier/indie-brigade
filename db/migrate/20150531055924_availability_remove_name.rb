class AvailabilityRemoveName < ActiveRecord::Migration
  def change
        change_table :availabilities do |t|
            t.remove :name
        end
  end
end
