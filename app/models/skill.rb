class Skill < ActiveRecord::Base
  include IdentityCache
  
  belongs_to :role
  has_many :devs, foreign_key: :main_skill_id
end
