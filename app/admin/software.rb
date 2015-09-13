ActiveAdmin.register Software, namespace: :super_admin do

  form do |f|
    f.inputs 'software' do
      f.input :name, as: :string
    end
    f.actions
  end

  index do
    selectable_column
    column :name
    actions
  end

  permit_params :name

end
