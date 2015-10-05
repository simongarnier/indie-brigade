ActiveAdmin.register User, namespace: :super_admin do
  permit_params :email, :encrypted_password, :is_admin, :is_super_admin

  menu priority: 2

  index do
    selectable_column
    column :id
    column :email
    column :is_admin
    column :is_super_admin
    actions
  end

  form do |f|
    f.inputs 'user' do
      f.input :email, as: :string
      f.input :encrypted_password, as: :string
      f.input :is_admin, as: :boolean
      f.input :is_super_admin, as: :boolean
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
