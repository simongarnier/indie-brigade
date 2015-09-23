ActiveAdmin.register Role, namespace: :super_admin do
  menu parent: "Entities"
  permit_params :code, :actor_form

  index do
    selectable_column
    column :id
    column :code
    column :actor_form
    actions
  end

  form do |f|
    f.inputs 'role' do
      f.input :code, as: :string
      f.input :actor_form, as: :string
    end
    f.actions
  end

end
