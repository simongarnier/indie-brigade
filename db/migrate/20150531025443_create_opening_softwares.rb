class CreateOpeningSoftwares < ActiveRecord::Migration
  def change
    create_table :opening_softwares do |t|
      t.references :opening, index: true, foreign_key: true
      t.references :software, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
