require 'clearance/token'

class Organization < ActiveRecord::Base
  belongs_to :user

  before_create do
    self.member_code = loop do
      random_token =  Clearance::Token.new
      break random_token unless self.class.exists?(member_code: random_token)
    end
  end
end
