class Opening < ActiveRecord::Base
  belongs_to :role
  belongs_to :availability
  belongs_to :dev
  belongs_to :project
end
