class Opening < ActiveRecord::Base
  belongs_to :role
  belongs_to :availability
end
