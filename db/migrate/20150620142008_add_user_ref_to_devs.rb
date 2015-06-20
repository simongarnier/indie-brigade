class AddUserRefToDevs < ActiveRecord::Migration
  def change
    add_reference :devs, :user, index: true, foreign_key: true
  end
end
