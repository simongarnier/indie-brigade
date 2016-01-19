class AddSocialAccountsToDevs < ActiveRecord::Migration
  def change
    add_column :devs, :facebook_handle, :string
    add_column :devs, :google_handle, :string
    add_column :devs, :tumblr_handle, :string
    add_column :devs, :youtube_handle, :string
    add_column :devs, :behance_handle, :string
    add_column :devs, :instagram_handle, :string
    add_column :devs, :twitter_handle, :string
    add_column :devs, :deviantart_handle, :string
    add_column :devs, :skype_handle, :string
    add_column :devs, :vimeo_handle, :string
    add_column :devs, :pinterest_handle, :string
    add_column :devs, :linkedin_link, :string
  end
end
