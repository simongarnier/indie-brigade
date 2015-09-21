class Condition < ActiveRecord::Base
  has_many :dev_conditions
  has_many :devs, through: :dev_conditions
end
