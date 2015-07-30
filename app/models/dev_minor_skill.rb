class DevMinorSkill < ActiveRecord::Base
  include CleanedBeforeSave

  belongs_to :dev
  belongs_to :skill
end
