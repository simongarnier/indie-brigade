class AddIsSuperAdminToUser < ActiveRecord::Migration
  def up
    add_column :users, :is_super_admin, :boolean, null: false, default:false
  end
  def down
    remove_column :users, :is_super_admin
  end
end
