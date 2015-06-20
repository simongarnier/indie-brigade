class DevMinorSkill < ActiveRecord::Base
  belongs_to :dev
  belongs_to :skill
end
