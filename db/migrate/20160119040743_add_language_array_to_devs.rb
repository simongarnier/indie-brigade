class AddLanguageArrayToDevs < ActiveRecord::Migration
  def change
    add_column :devs, :languages, :text, array:true, default: []
  end
end
