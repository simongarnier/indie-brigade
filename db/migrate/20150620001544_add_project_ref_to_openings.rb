class AddProjectRefToOpenings < ActiveRecord::Migration
  def change
    add_reference :openings, :project, index: true, foreign_key: true

  end
end
