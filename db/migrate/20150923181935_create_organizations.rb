class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :domain
      t.boolean :is_legit
      t.string :member_code
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
