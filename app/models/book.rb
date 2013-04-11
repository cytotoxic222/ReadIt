class Book < ActiveRecord::Base
  has_many :reviews
  attr_accessible :author, :description, :title, :cover_image
  has_attached_file :cover_image, :styles => { :medium => "300x300>" }

  validates_attachment_size :cover_image, :less_than => 5.megabytes
  validates_attachment_content_type :cover_image,
                                    :content_type => ['image/jpg', 'image/jpeg', 'image/gif', 'image/png']
end
