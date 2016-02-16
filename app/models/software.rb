class Software < ActiveRecord::Base
  include IdentityCache

  has_many :dev_conditions, dependent: :delete_all
  has_many :devs, through: :dev_conditions

  def icon_path
    "/images/softwareicons/#{filename}"
  end
end
