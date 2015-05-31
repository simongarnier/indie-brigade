class CreateDevSoftwares < ActiveRecord::Migration
  def change
    create_table :dev_softwares do |t|
      t.references :dev, index: true, foreign_key: true
      t.references :software, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
