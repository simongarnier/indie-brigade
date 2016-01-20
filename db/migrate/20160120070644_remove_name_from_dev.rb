class RemoveNameFromDev < ActiveRecord::Migration
  def change
    remove_column :devs, :name, :string
  end
end
