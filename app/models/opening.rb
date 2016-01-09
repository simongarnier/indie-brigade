class Opening < ActiveRecord::Base
  belongs_to :role
  has_and_belongs_to_many :availabilities
  belongs_to :dev
  belongs_to :project
end
