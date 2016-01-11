ActiveAdmin.register Software, namespace: :super_admin do
  menu parent: "Entities"

  form do |f|
    f.inputs 'software' do
      f.input :name, as: :string
      f.input :filename, as: :string
    end
    f.actions
  end

  index do
    selectable_column
    column :name
    column :filename
    actions
  end

  permit_params :name, :filename

end
