class CreateDevMajorSkills < ActiveRecord::Migration
  def change
    create_table :dev_major_skills do |t|
      t.references :dev, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
