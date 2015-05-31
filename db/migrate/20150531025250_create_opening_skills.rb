class CreateOpeningSkills < ActiveRecord::Migration
  def change
    create_table :opening_skills do |t|
      t.references :opening, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
