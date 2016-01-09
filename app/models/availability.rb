class Availability < ActiveRecord::Base
  def name
    "#{self.per_week} :: #{self.duration}"
  end
end
