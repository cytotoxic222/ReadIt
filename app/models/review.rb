class Review < ActiveRecord::Base
  belongs_to :book
  attr_accessible :author, :rating, :text
end
