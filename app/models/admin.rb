class Admin < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :avatar
  acts_as_authentic
end
