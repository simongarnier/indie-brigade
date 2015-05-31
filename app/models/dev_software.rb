class DevSoftware < ActiveRecord::Base
  belongs_to :dev
  belongs_to :software
end
