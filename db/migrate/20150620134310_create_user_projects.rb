class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :project, index: true, foreign_key: true, null: false
    end
  end
end
