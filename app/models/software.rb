class Software < ActiveRecord::Base
  include IdentityCache

  has_many :dev_conditions, dependent: :delete_all
  has_many :devs, through: :dev_conditions
end
