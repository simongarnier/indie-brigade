class Dev < ActiveRecord::Base
  belongs_to :role
  belongs_to :availability
  belongs_to :user

  has_many :dev_conditions
  has_many :conditions, through: :dev_conditions

  has_many :dev_major_skills
  has_many :major_skills, :through => :dev_major_skills, :source => :skill

  has_many :dev_minor_skills
  has_many :minor_skills, :through => :dev_minor_skills, :source => :skill

  attr_reader :skills

  def skills
    minor_skills + major_skills
  end
end
