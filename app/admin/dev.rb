ActiveAdmin.register Dev, namespace: :super_admin do
  controller do
    def scoped_collection
      super.includes :role
      super.includes :availability
      super.includes :user
      super.includes :conditions
    end
  end

  index do
    selectable_column
    column :id
    column :name
    column :description
    column :role, sortable: 'roles.code' do |dev|
      link_to dev.role.code, super_admin_role_path(dev.role)
    end
    column :user, sortable: 'user.email' do |dev|
      link_to dev.user.email, super_admin_user_path(dev.user)
    end
    column :availability, sortable: 'availability.name' do |dev|
      link_to dev.availability.name, super_admin_availability_path(dev.availability)
      link_to dev.availability.name, super_admin_availability_path(dev.availability)
    end
    column "Conditions", sortable: false do |dev|
      dev.conditions.map do |condition|
        link_to condition.name, super_admin_condition_path(condition)
      end
    end

    actions
  end
end
