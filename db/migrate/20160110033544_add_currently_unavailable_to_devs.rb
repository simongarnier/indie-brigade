class AddCurrentlyUnavailableToDevs < ActiveRecord::Migration
  def change
    add_column :devs, :currently_unavailable, :boolean, null: false, default: false
  end
end
