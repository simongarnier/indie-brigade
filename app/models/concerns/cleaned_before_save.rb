require 'active_support/concern'

module CleanedBeforeSave
  extend ActiveSupport::Concern

  included do
    before_save :clean_dev_skill
  end

  private
    def clean_dev_skill
      DevMinorSkill.find_by(dev_id: dev.id, skill_id: skill_id).try(:delete)
      DevMajorSkill.find_by(dev_id: dev.id, skill_id: skill_id).try(:delete)
    end
end
