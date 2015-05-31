class DevCondition < ActiveRecord::Base
  belongs_to :dev
  belongs_to :condition
end
