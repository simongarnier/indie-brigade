class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :per_week
      t.integer :number_of_month

      t.timestamps null: false
    end
  end
end
