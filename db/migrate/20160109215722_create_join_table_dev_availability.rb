class CreateJoinTableDevAvailability < ActiveRecord::Migration
  def change
    create_join_table :devs, :availabilities do |t|
      t.index [:dev_id, :availability_id]
      t.index [:availability_id, :dev_id]
    end
  end
end
