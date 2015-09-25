class Role < ActiveRecord::Base
  include IdentityCache
  
  has_many :skills, dependent: :delete_all
end
