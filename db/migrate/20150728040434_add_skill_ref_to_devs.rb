class AddSkillRefToDevs < ActiveRecord::Migration
    def change
      add_reference :devs, :skill, index: true, foreign_key: true
      rename_column :devs, :skill_id, :main_skill_id
    end
end
