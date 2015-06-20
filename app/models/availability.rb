class Availability < ActiveRecord::Base
    belongs_to :availability_per_week
    belongs_to :availability_duration

    attr_reader :name

    def name
        "#{self.availability_per_week.name} :: #{self.availability_duration.name}"
    end
end
