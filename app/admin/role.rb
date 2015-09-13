ActiveAdmin.register Role, namespace: :super_admin do

  permit_params do
    permitted = [:code]
  end


end
