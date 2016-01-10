ActiveAdmin.register Availability, namespace: :super_admin do
  menu parent: "Entities"
  permit_params :availability_per_week_id, :availability_duration_id

  index do
    selectable_column
    column :id
    column "Name" do |availability|
      link_to availability.name, super_admin_availability_path(availability)
    end
    actions
  end
end
