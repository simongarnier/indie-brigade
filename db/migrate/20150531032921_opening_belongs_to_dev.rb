class OpeningBelongsToDev < ActiveRecord::Migration
  def change
      change_table :openings do |t|
          t.references :dev, index: true, foreign_key: true
      end
  end
end
