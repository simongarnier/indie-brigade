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

  def per_week_lower
    return nil unless self.per_week
    self.per_week.min
  end

  def per_week_upper
    return nil unless self.per_week
    self.per_week.max
  end

  def per_week_lower= i
    i = i.to_i
    if per_week_upper then
      self.per_week = i..per_week_upper
    else
      self.per_week = i..i
    end
    per_week_lower
  end

  def per_week_upper= i
    i = i.to_i
    if per_week_lower then
      self.per_week = per_week_lower..i
    else
      self.per_week = i..i
    end
    per_week_upper
  end

  def for_number_of_weeks= i
    i = i.to_i
    self.per_week = per_week_lower/i..per_week_upper/i
  end

  def for_number_of_weeks
    1 # always return because we are mutating the range when assigned, not actually saving the value
  end
end
