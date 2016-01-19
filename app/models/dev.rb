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

  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/default_profile.png"
  has_attached_file :banner, styles: { display: "960x240#"}, default_url: "/images/default_banner.png"
  # Validate content type
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_content_type :banner, content_type: /\Aimage/
  # Validate filename
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  validates_attachment_file_name :banner, matches: [/png\Z/, /jpe?g\Z/]

  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/png"] }, size: { in: 0..1.megabytes }
  validates_attachment :banner, content_type: { content_type: ["image/jpeg", "image/png"] }, size: { in: 0..5.megabytes }

  def skills
    minor_skills + major_skills
  end

  def major_skills_by_role
    major_skills.sort_by{|skill| skill.role.code}
  end

  def minor_skills_by_role
    minor_skills.sort_by{|skill| skill.role.code}
  end

  def compatible_devs
    Availability.for_available_type("Opening").compatible_availability(self).available
  end
end
