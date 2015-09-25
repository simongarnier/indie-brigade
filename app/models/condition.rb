class Condition < ActiveRecord::Base
  include IdentityCache

  has_many :dev_conditions
  has_many :devs, through: :dev_conditions
end
