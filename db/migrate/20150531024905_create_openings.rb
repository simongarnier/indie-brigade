class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.text :name
      t.references :role, index: true, foreign_key: true
      t.references :availability, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
