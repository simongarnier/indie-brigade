ActiveAdmin.register Availability, namespace: :super_admin do
  menu parent: "Entities"
  permit_params :per_week, :duration

  index do
    selectable_column
    column :id
    column :per_week
    column :duration
    actions
  end
end
