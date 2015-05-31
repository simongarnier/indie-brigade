class CreateDevConditions < ActiveRecord::Migration
  def change
    create_table :dev_conditions do |t|
      t.references :dev, index: true, foreign_key: true
      t.references :condition, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
