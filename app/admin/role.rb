ActiveAdmin.register Role, namespace: :super_admin do

  permit_params do
    permitted = [:code, :actor_form]
  end


end
