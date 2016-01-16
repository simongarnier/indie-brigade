class Availability < ActiveRecord::Base
  belongs_to :project_size
  belongs_to :available, polymorphic: true

  scope :for_available_type, lambda { |class_name| where "available_type = ?", class_name }
  scope :compatible_availability, lambda { |availability|
    if !availability.project_size.need_involvement
      where(
        "   id != ?
        AND project_size_id = ?",
        availability.id,
        availability.project_size_id
      )
    else
      where(
        "   id != ?
        AND project_size_id = ?
        AND per_week && int4range(?, ?)",
        availability.id,
        availability.project_size_id,
        availability.per_week.first,
        availability.per_week.last+1
      )
    end
  }
end
