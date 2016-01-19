class AddAttachmentBannerToDevs < ActiveRecord::Migration
  def up
    add_attachment :devs, :banner
  end

  def down
    remove_attachment :devs, :banner
  end
end
