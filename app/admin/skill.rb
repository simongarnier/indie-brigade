ActiveAdmin.register Skill do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  show do
    attributes_table do
      row :short_name
      row :long_name
      row :role do |skill|
        skill.role.code
      end
    end
  end

  form do |f|
    f.inputs 'skill' do
      f.input :short_name
      f.input :long_name
      f.input :role, as: :select, collection: Role.all.collect {|role| [role.code, role.id] }
    end
    f.actions
  end
  permit_params :short_name, :long_name, :role_id
end
