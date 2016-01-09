class Availability < ActiveRecord::Base
  belongs_to :project_size
  has_and_belongs_to_many :openings
  has_and_belongs_to_many :devs
end
