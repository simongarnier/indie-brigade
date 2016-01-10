class Opening < ActiveRecord::Base
  belongs_to :role
  belongs_to :dev
  belongs_to :project

  has_many :availabilities, as: :available

  def compatible_devs
    Availability.for_available_type("Dev").compatible_availability(self).available
  end
end
