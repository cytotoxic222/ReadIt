class User < ActiveRecord::Base
  has_many :books
  has_many :reviews
  attr_accessible :username, :email, :first_name, :last_name, :password, :password_confirmation
  acts_as_authentic
end
