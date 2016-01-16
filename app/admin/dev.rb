ActiveAdmin.register Dev, namespace: :super_admin do
  menu parent: "Users"

  permit_params :name, :description, :role_id, :main_skill_id

  controller do
    def scoped_collection
      super.includes :role
      super.includes :user
      super.includes :conditions
    end
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :role do |dev|
        dev.role.try(:code)
      end
      row :main_skill do |dev|
        dev.main_skill.try(:short_name)
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'dev' do
      f.input :name, as: :string
      f.input :description, as: :text
      f.input :role, as: :select, collection: Role.all.collect {|role| [role.code, role.id] }, include_blank: true
      f.input :main_skill, as: :select, collection: Skill.all.collect {|skill| [skill.short_name, skill.id] }, include_blank: true
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :name
    column :description
    column :role, sortable: 'role.code' do |dev|
      link_to dev.role.code, super_admin_role_path(dev.role) if dev.role
    end
    column :main_skill, sortable: 'skill.short_name' do |dev|
      link_to dev.main_skill.short_name, super_admin_skill_path(dev.main_skill) if dev.main_skill
    end
    column :user, sortable: 'user.email' do |dev|
      link_to dev.user.email, super_admin_user_path(dev.user) if dev.user
    end
    actions
  end
end
