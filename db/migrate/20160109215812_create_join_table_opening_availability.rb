class CreateJoinTableOpeningAvailability < ActiveRecord::Migration
  def change
    create_join_table :openings, :availabilities do |t|
      t.index [:opening_id, :availability_id]
      t.index [:availability_id, :opening_id]
    end
  end
end
