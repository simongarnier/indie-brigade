class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.text :short_name
      t.text :long_name
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
