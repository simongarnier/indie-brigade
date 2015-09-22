class AddActorFormToRoles < ActiveRecord::Migration
  def up
    add_column :roles, :actor_form, :text, null: true
  end

  def down
    remove_column :roles, :actor_form
  end
end
