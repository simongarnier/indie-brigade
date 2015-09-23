class User < ActiveRecord::Base
  include Clearance::User

  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :organizations

  has_one :dev
end
