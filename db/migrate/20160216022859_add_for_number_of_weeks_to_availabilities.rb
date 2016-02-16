class AddForNumberOfWeeksToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :for_number_of_weeks, :int, default: 1, null: false
  end
end
