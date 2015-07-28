class AddIsMainSkillToDevMajorSKills < ActiveRecord::Migration
  def self.up
    add_column :dev_major_skills, :is_main, :boolean, default: false, null: false
  end

  def self.down
    remove_column :dev_major_skills, :is_main
  end
end
