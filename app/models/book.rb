class Book < ActiveRecord::Base
  attr_accessible :description, :image_url, :title
  has_attached_file :image
end
