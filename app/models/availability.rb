class Availability < ActiveRecord::Base
  belongs_to :project_size
  belongs_to :available, polymorphic: true

  validates :for_number_of_weeks, presence: true, inclusion: {in: [1, 2, 4]}
  validates :per_week, presence: true
  validates :project_size, presence: true
  validate :upper_greater_than_lower

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
        availability.per_week.first/availability.for_number_of_weeks,
        availability.per_week.last+1/availability.for_number_of_weeks
      )
    end
  }

  def per_week_lower
    self.per_week.try(:min)
  end

  def per_week_upper
    self.per_week.try(:max)
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

  def upper_greater_than_lower
    if per_week && per_week_upper < per_week_lower
      errors.add(:per_week, I18n.t('activerecord.errors.models.availability.attributes.per_week'))
    end
  end

  def as_sentence
    "Ready to work for #{per_week_lower} to #{per_week_upper} every #{Availability.for_number_of_weeks_as_tuples.select{|t| t.first == for_number_of_weeks}.first.last}"
  end

  def self.for_number_of_weeks_as_tuples
    [[1, "week"], [2, "two weeks"], [4, "month"]]
  end
end
