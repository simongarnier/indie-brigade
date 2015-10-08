include ApplicationHelper

class SkillsController < ApplicationController
  before_action :ensure_dev_owned_by_current_user, only: [:manage]

  def manage
    
  end

end
