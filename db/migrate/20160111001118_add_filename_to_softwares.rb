class AddFilenameToSoftwares < ActiveRecord::Migration
  def change
    add_column :softwares, :filename, :string
  end
end
