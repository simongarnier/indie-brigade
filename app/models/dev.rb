class Dev < ActiveRecord::Base
  include IdentityCache

  belongs_to :role
  belongs_to :user
  belongs_to :main_skill, class_name: 'Skill', foreign_key: 'main_skill_id'

  has_many :dev_conditions, dependent: :delete_all
  has_many :conditions, through: :dev_conditions

  has_many :dev_major_skills , dependent: :delete_all
  has_many :major_skills, through: :dev_major_skills, source: :skill

  has_many :dev_minor_skills, dependent: :delete_all
  has_many :minor_skills, through: :dev_minor_skills, source: :skill

  has_many :availabilities, as: :available

  attr_reader :skills

  def skills
    minor_skills + major_skills
  end

  def compatible_devs
    Availability.for_available_type("Opening").compatible_availability(self).available
  end
end
