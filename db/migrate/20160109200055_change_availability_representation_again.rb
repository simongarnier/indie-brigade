class ChangeAvailabilityRepresentationAgain < ActiveRecord::Migration
  def up
    create_table :project_sizes do |table|
      table.string :text, null: false
      table.boolean :need_involvement, null: false, default: true
    end

    ProjectSize.create(text: "Month-long Jam")
    ProjectSize.create(text: "Short Project (0-3 months)")
    ProjectSize.create(text: "Medium project (3-6 months)")
    ProjectSize.create(text: "Long project (6-12 months)")
    ProjectSize.create(text: "Very long project (12+ months)")
    ProjectSize.create(text: "Weekend Jam", need_involvement: false)

    remove_column :devs, :availability_id
    remove_column :openings, :availability_id

    Opening.destroy_all
    Availability.destroy_all

    remove_column :availabilities, :per_week
    remove_column :availabilities, :duration
    add_column :availabilities, :per_week, "int4range", null: true
    add_reference :availabilities, :project_size, index: true, null: false
    add_foreign_key :availabilities, :project_sizes
    add_reference :availabilities, :available, polymorphic: true, index: true

    execute "CREATE INDEX availabilities_gist_data ON availabilities USING gist(per_week);"

    add_column :devs, :unavailable, :boolean, null: false, default: false

  end

  def down
    add_reference :devs, :availability, index: true, null: true
    add_foreign_key :devs, :availabilities

    add_reference :openings, :availability, index: true, null: true
    add_foreign_key :openings, :availabilities

    execute "DROP INDEX availabilities_gist_data;"
    remove_column :availabilities, :per_week
    add_column :availabilities, :per_week, :string
    add_column :availabilities, :duration, :string
    remove_foreign_key :availabilities, :project_sizes
    remove_column :availabilities, :project_size_id
    remove_reference :availabilities, :available, polymorphic: true

    remove_column :devs, :unavailable

    drop_table :project_sizes
  end
end
