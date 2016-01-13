class AddAttachmentAvatarToUsers < ActiveRecord::Migration
  def up
    add_attachment :devs, :avatar
  end

  def down
    remove_attachment :devs, :avatar
  end
end
