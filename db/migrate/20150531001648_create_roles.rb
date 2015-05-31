class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.text :code

      t.timestamps null: false
    end
  end
end
