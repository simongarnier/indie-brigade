ActiveAdmin.register Condition, namespace: :super_admin do
  menu parent: "Entities"
  permit_params :name

  index do
    selectable_column
    column :id
    column :name
    actions
  end

  form do |f|
    f.inputs 'condition' do
      f.input :name, as: :string
    end
    f.actions
  end
end
