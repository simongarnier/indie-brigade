class DevMajorSkill < ActiveRecord::Base
  include CleanedBeforeSave
  before_save :set_all_to_is_not_main

  belongs_to :dev
  belongs_to :skill

  private
    def set_all_to_is_not_main
      if is_main then
        self.where(dev_id: dev_id).update_all(is_main: false)
      end
    end
end
