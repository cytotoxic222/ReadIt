class Admin < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  acts_as_authentic
end
