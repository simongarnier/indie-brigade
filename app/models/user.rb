class User < ActiveRecord::Base
  include Clearance::User

  validates :over_eighteen, acceptance: true
  validates :firstname, presence: true
  validates :lastname, presence: true

  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :organizations

  has_one :dev, dependent: :delete
end
