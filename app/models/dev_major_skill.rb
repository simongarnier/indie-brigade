class DevMajorSkill < ActiveRecord::Base
  belongs_to :dev
  belongs_to :skill
end
