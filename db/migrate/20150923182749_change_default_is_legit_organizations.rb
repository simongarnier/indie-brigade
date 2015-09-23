class ChangeDefaultIsLegitOrganizations < ActiveRecord::Migration
  def up
    Organization.update_all(is_legit: false)
    change_column_default :organizations, :is_legit, :false
    change_column_null :organizations, :is_legit, :false
  end
  def down
    change_column_default :organizations, :is_legit, :null
    change_column_null :organizations, :is_legit, :true
  end
end
