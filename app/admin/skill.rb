ActiveAdmin.register Skill, namespace: :super_admin do
  controller do
    def scoped_collection
      super.includes :role
    end
  end

  show do
    attributes_table do
      row :id
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
      f.input :role, as: :select, collection: Role.all.collect {|role| [role.code, role.id] }, include_blank: false
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :short_name
    column :long_name
    column :role, sortable: 'roles.code' do |skill|
      link_to skill.role.code, super_admin_role_path(skill.role)
    end
    actions
  end

  permit_params :short_name, :long_name, :role_id
end
