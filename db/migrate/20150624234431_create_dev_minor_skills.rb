class CreateDevMinorSkills < ActiveRecord::Migration
  def change
    create_table :dev_minor_skills do |t|
      t.references :dev, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
