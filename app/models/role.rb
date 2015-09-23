class Role < ActiveRecord::Base
  has_many :skills, dependent: :delete_all
end
