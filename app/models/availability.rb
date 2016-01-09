class Availability < ActiveRecord::Base
  def name sep = '::'
    self.per_week + sep + self.duration
  end
end
