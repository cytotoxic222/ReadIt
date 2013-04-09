class Book < ActiveRecord::Base
  has_many :reviews
  attr_accessible :author, :description, :title
end
