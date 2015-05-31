class CreateDevs < ActiveRecord::Migration
  def change
    create_table :devs do |t|
      t.text :name
      t.text :description
      t.references :role, index: true, foreign_key: true
      t.references :availability, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
