class AddNullFalseToDevConditions < ActiveRecord::Migration
  def up
    DevCondition.where(condition_id: nil).destroy_all
    DevCondition.where(dev_id: nil).destroy_all
    change_column_null :dev_conditions, :condition_id, false
    change_column_null :dev_conditions, :dev_id, false
  end

  def down
    change_column_null :dev_conditions, :condition_id, true
    change_column_null :dev_conditions, :dev_id, true
  end
end
