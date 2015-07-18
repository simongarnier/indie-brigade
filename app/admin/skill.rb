ActiveAdmin.register Skill do
  controller do
    def scoped_collection
      super.includes :role # prevents N+1 queries to your database
    end
  end

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
      f.input :short_name, as: :string
      f.input :long_name, as: :string
      f.input :role, as: :select, collection: Role.all.collect {|role| [role.code, role.id] }
    end
    f.actions
  end

  index do
    selectable_column
    column :short_name
    column :long_name
    column :role, sortable: 'roles.code' do |skill|
      link_to skill.role.code, admin_role_path(skill.role)
    end
    actions
  end

  permit_params :short_name, :long_name, :role_id
end
