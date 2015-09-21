ActiveAdmin.register Availability, namespace: :super_admin do
  index do
    selectable_column
    column :id
    column "Name" do |availability|
      link_to availability.name, super_admin_availability_path(availability)
    end
    actions
  end
  permit_params :availability_per_week_id, :availability_duration_id
end
